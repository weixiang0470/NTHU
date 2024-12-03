from collections import deque

def topological_sort(graph, V):
    # 入度數組
    in_degree = [0] * V
    for u in graph:
        for v in graph[u]:
            in_degree[v] += 1
    
    # 初始化隊列，將所有入度為0的頂點加入
    queue = deque([u for u in range(V) if in_degree[u] == 0])
    topo_order = []
    
    while queue:
        u = queue.popleft()
        topo_order.append(u)
        for v in graph[u]:
            in_degree[v] -= 1
            if in_degree[v] == 0:
                queue.append(v)
    
    return topo_order

def count_paths(graph, a, b, V):
    # 拓撲排序
    topo_order = topological_sort(graph, V)
    
    # 初始化路徑數組
    paths = [0] * V
    paths[a] = 1  # 從a到a有一條路徑（即空路徑）
    
    # 遍歷拓撲排序中的每個頂點
    for u in topo_order:
        # if paths[u] > 0:  # 只有當u有路徑時才更新其鄰接頂點
            for v in graph[u]:
                paths[v] += paths[u]
    
    # 返回從a到b的路徑數量
    return paths[b]

# 範例圖
graph = {
    0: [1, 2],  # a -> o, p
    1: [3],     # o -> r
    2: [3],     # p -> r
    3: [4],     # r -> y
    4: [5],     # y -> v
    5: []       # v
}
V = 6  # 顶点数量
a = 0  # 起始顶点
b = 5  # 目标顶点

# 計算路徑數量
print(count_paths(graph, a, b, V))  # 輸出從a到b的路徑數量

