require_relative 'undirected_graph.rb'

# DFS 알고리즘
def dfs(undirected_graph)
  vertex_list = undirected_graph.vertex_list
  adjacency_list = undirected_graph.adjacency_list

  # 스택에 정점 리스트의 0번 인덱스에 해당하는 값을 초기화한다.
  # 방문한 정점을 확인하기 위해 visited 변수에 빈 배열을 할당한다.
  stack = [vertex_list[0]]
  visited = []

  # 스택에 값이 존재 하는 동안,
  until stack.empty?
    # current 변수에 스택의 값을 pop 하여 넣고,
    current = stack.pop

    # current에 인접한 정점 중 visited 배열에 없는 정점을 스택에 push한다.
    adjacency_list[current].each do |vertex|
      stack << vertex unless visited.include?(vertex)
    end

    # 그리고 current 변수의 값을 visited 배열에 추가한다.
    visited << current
  end
  visited
end

# dfs 알고리즘을 수행 후 결과에 중복된 값이 있으면 사이클이 존재 하는 것으로,
# 아니면 존재하지 않는 것으로 값을 반환한다.
def cycle?(undirected_graph)
  dfs_result = dfs(undirected_graph)
  dfs_result != dfs_result.uniq
end

graph = UndirectedGraph.new

7.times { graph.add_vertex }

graph.add_edge([0, 1], [0, 2], [1, 3], [2, 4], [2, 5], [4, 6])
graph.add_edge([0, 1])

p dfs(graph)
p cycle?(graph)

graph.add_edge([4, 5])
p cycle?(graph)