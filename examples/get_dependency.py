import re
from collections import defaultdict, deque

input_file = "value_flow_output.txt"

dependencies = set()
graph = defaultdict(set)

line_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)\s*->\s*\{(.*)\}')
triple_pattern = re.compile(r'\(\s*([^,]+?)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)')

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

    if a_depends_on_b and b_depends_on_a:
        return 2
    elif a_depends_on_b:
        return -1
    elif b_depends_on_a:
        return 1
    else:
        return 0

# 示例查询
query_a = ("example.c", 3, 9)
query_b = ("example.c", 2, 9)
result = dependency_relation(query_a, query_b, graph)
print(f"{query_a} 和 {query_b} 的依赖关系：{result}")

# ------------------------------------------
# 打印完整依赖表
# ------------------------------------------
print(f"\n共 {len(dependencies)} 条有效依赖关系：\n")

for dependent, source in sorted(dependencies):
    print(f"{dependent} 依赖于 {source}")
