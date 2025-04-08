import re
from collections import defaultdict, deque

import argparse

def main():
    parser = argparse.ArgumentParser(description="Compare SVF dependency with labeled JSON")
    parser.add_argument("--json", required=True, help="Path to original JSON file (e.g., example.json)")
    parser.add_argument("--value-flow", required=True, help="Path to value flow result file (e.g., value_flow_output.txt)")
    args = parser.parse_args()

    # ----------------------------
    # 构建依赖图（从 value-flow 文件）
    # ----------------------------
    graph = defaultdict(set)
    line_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)\s*->\s*\{(.*)\}')
    triple_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\)')

    def is_valid_node(node):
        filename, line, _ = node
        return filename != "-" and int(line) != 0

    with open(args.value_flow, 'r') as f:
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

    # ----------------------------
    # 开始处理 JSON 与依赖比较
    # ----------------------------
    process_and_compare(args.json, graph)




def is_valid_node(node):
    filename, line, _ = node
    return filename != "-" and int(line) != 0

with open(input_file, 'r') as f:
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
                dependencies.add((tgt, src))
                # ⛳ 注意此处：target 依赖 source，所以建边 target -> source
                graph[tgt].add(src)

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
    # 如果 a 能走到 b，说明 a 依赖 b（b 是影响 a 的变量）
    a_depends_on_b = is_reachable(a, b, graph)
    b_depends_on_a = is_reachable(b, a, graph)

    # if a_depends_on_b and b_depends_on_a:
    #     return 2
    if a_depends_on_b:
        return -1
    elif b_depends_on_a:
        return 1
    else:
        return 0

import json
import os

def load_queries_from_json(json_file):
    with open(json_file, "r") as f:
        data = json.load(f)

    queries = []
    for entry in data:
        if len(entry["varLocations"]) >= 2:
            loc1 = entry["varLocations"][0]
            loc2 = entry["varLocations"][1]
            a = (loc1[1], loc1[2], loc1[3])  # (filename, line, col)
            b = (loc2[1], loc2[2], loc2[3])
            queries.append((a, b))
    return queries

def infer_label_from_dependency(a, b, graph):
    result = dependency_relation(a, b, graph)
    if result == -1:
        return "depends_on"
    elif result == 1:
        return "depended_by"
    else:
        return "no_dependency"

def generate_new_json_with_dependency_labels(original_json_path, graph):
    with open(original_json_path, "r") as f:
        original_data = json.load(f)

    new_data = []
    for entry in original_data:
        if len(entry["varLocations"]) >= 2:
            loc1 = entry["varLocations"][0]
            loc2 = entry["varLocations"][1]
            a = (loc1[1], loc1[2], loc1[3])
            b = (loc2[1], loc2[2], loc2[3])
            label = infer_label_from_dependency(a, b, graph)
            new_entry = dict(entry)  # shallow copy
            new_entry["label"] = label
            new_data.append(new_entry)

    new_json_path = original_json_path.replace(".json", "-svf.json")
    with open(new_json_path, "w") as f:
        json.dump(new_data, f, indent=4)

    return original_data, new_data, new_json_path

def compare_dependency_labels(original_data, new_data):
    mismatches = 0
    total = min(len(original_data), len(new_data))
    mismatch_details = defaultdict(int)

    for i in range(total):
        old_label = original_data[i].get("label")
        new_label = new_data[i].get("label")
        if old_label != new_label:
            mismatches += 1
            key = f"{old_label} -> {new_label}"
            mismatch_details[key] += 1

    percent = (mismatches / total * 100) if total > 0 else 0
    print(f"⚠️ 依赖关系不一致的变量对有 {mismatches}/{total}，占比 {percent:.2f}%\n")

    if mismatch_details:
        print("📊 各类不一致类型及比例：")
        for label_change, count in sorted(mismatch_details.items(), key=lambda x: -x[1]):
            ratio = (count / total) * 100
            print(f"  {label_change:30} : {count:4} 个，占比 {ratio:.2f}%")
    else:
        print("✅ 所有 label 一致。")

    return percent

# 主执行逻辑
def process_and_compare(json_file_path, graph):
    original_data, new_data, new_json_path = generate_new_json_with_dependency_labels(json_file_path, graph)
    print(f"✅ 新的 JSON 文件已写入：{new_json_path}")
    compare_dependency_labels(original_data, new_data)


# # 示例查询
# query_a = ("example.c", 3, 9)
# query_b = ("example.c", 2, 9)
# result = dependency_relation(query_a, query_b, graph)
# print(f"{query_a} 和 {query_b} 的依赖关系：{result}")

# # ------------------------------------------
# # 打印完整依赖表
# # ------------------------------------------
# print(f"\n共 {len(dependencies)} 条有效依赖关系：\n")

# for dependent, source in sorted(dependencies):
#     print(f"{dependent} 依赖于 {source}")

# json_file_path = "example.json"  # 你的原始 JSON 文件名
# process_and_compare(json_file_path, graph)

if __name__ == "__main__":
    main()