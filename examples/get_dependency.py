import re
import json
import argparse
from collections import defaultdict, deque

# 构建依赖图
def build_dependency_graph(value_flow_path):
    graph = defaultdict(set)
    line_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)\s*->\s*\{(.*)\}')
    triple_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\)')

    def is_valid_node(node):
        filename, line, _ = node
        return filename != "-" and int(line) != 0

    with open(value_flow_path, 'r') as f:
        for line in f:
            line = line.strip()
            match = line_pattern.match(line)
            if match:
                src_file, src_line, src_col, targets_str = match.groups()
                src = (src_file, int(src_line), int(src_col))
                if not is_valid_node(src):
                    continue
                for target_match in triple_pattern.finditer(targets_str):
                    tgt_file, tgt_line, tgt_col = target_match.groups()
                    tgt = (tgt_file, int(tgt_line), int(tgt_col))
                    if not is_valid_node(tgt):
                        continue
                    graph[tgt].add(src)
    return graph

# 依赖判断
def is_reachable(start, end, graph):
    visited = set()
    queue = deque([start])
    while queue:
        node = queue.popleft()
        if node == end:
            return True
        for neighbor in graph.get(node, []):
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    return False

def dependency_relation(a, b, graph):
    a_depends_on_b = is_reachable(a, b, graph)
    b_depends_on_a = is_reachable(b, a, graph)
    if a_depends_on_b:
        return -1
    elif b_depends_on_a:
        return 1
    else:
        return 0

# 推断 label
def infer_label_from_dependency(a, b, graph):
    result = dependency_relation(a, b, graph)
    if result == -1:
        return "depends_on"
    elif result == 1:
        return "depended_by"
    else:
        return "no_dependency"

# 生成新 JSON
def generate_new_json_with_dependency_labels(original_json_path, graph):
    with open(original_json_path, "r") as f:
        original_data = json.load(f)

    new_data = []
    unknown_count = 0

    for entry in original_data:
        if len(entry["varLocations"]) >= 2:
            loc1 = entry["varLocations"][0]
            loc2 = entry["varLocations"][1]
            a = (loc1[1], loc1[2], loc1[3])
            b = (loc2[1], loc2[2], loc2[3])

            a_exists = a in graph or any(a in v for v in graph.values())
            b_exists = b in graph or any(b in v for v in graph.values())

            new_entry = dict(entry)  # copy

            if not (a_exists and b_exists):
                # 如果 a 或 b 不存在于图中，则标记为未知
                print(f"⚠️ 变量 {a} 或 {b} 不在图中，标记为未知")
                unknown_count += 1
                new_entry["label"] = entry.get("label", "no_dependency")
            else:
                label = infer_label_from_dependency(a, b, graph)
                new_entry["label"] = label

            new_data.append(new_entry)

    new_json_path = original_json_path.replace(".json", "-svf.json")
    with open(new_json_path, "w") as f:
        json.dump(new_data, f, indent=4)

    return original_data, new_data, new_json_path, unknown_count

# 比较 label
def compare_dependency_labels(original_data, new_data, unknown_count=0):
    mismatches = 0
    total = min(len(original_data), len(new_data))
    mismatch_details = defaultdict(int)

    for i in range(total):
        old_label = original_data[i].get("label")
        new_label = new_data[i].get("label")

        if old_label == new_label:
            continue
        # 跳过未知项（没有参与判断）
        if (not old_label and new_label) or (not new_label and old_label):
            continue

        mismatches += 1
        key = f"{old_label} -> {new_label}"
        mismatch_details[key] += 1

    effective_total = total - unknown_count
    percent = (mismatches / effective_total * 100) if effective_total else 0

    print(f"⚠️ 依赖关系不一致的变量对有 {mismatches}/{effective_total}（排除 {unknown_count} 个未知），占比 {percent:.2f}%\n")

    if mismatch_details:
        print("📊 各类不一致类型及比例：")
        for label_change, count in sorted(mismatch_details.items(), key=lambda x: -x[1]):
            ratio = (count / effective_total) * 100 if effective_total else 0
            print(f"  {label_change:30} : {count:4} 个，占比 {ratio:.2f}%")
    else:
        print("✅ 所有 label 一致（排除未知项）。")

    return percent

# 主逻辑
def process_and_compare(json_file_path, value_flow_path):
    graph = build_dependency_graph(value_flow_path)
    original_data, new_data, new_json_path, unknown_count = generate_new_json_with_dependency_labels(json_file_path, graph)
    print(f"✅ 新的 JSON 文件已写入：{new_json_path}")
    compare_dependency_labels(original_data, new_data, unknown_count)

# 命令行入口
def main():
    parser = argparse.ArgumentParser(description="Compare dependency labels using SVF value-flow output")
    parser.add_argument("--json", required=True, help="Path to input JSON file")
    parser.add_argument("--value-flow", required=True, help="Path to value flow output file")
    args = parser.parse_args()

    process_and_compare(args.json, args.value_flow)

if __name__ == "__main__":
    main()
