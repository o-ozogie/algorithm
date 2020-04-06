require_relative 'undirected_graph.rb'

# BFS 알고리즘
def bfs(undirected_graph)
  vertex_list = undirected_graph.vertex_list
  adjacency_list = undirected_graph.adjacency_list

  # 큐에 정점 리스트의 0번 인덱스에 해당하는 값을 초기화한다.
  # 방문한 정점을 확인하기 위해 visited 변수에 빈 배열을 할당한다.
  queue = [vertex_list[0]]
  visited = []

  # 큐에 값이 존재 하는 동안,
  until queue.empty?
    # current 변수에 큐의 값을 pop 하여 넣고,(선입선출이므로 배열의 앞에서부터 pop 된다.)
    current = queue.shift

    # current에 인접한 정점 중 visited 배열에 없는 정점을 큐에 push한다.
    adjacency_list[current].each do |vertex|
      queue << vertex unless visited.include?(vertex)
    end

    # 그리고 current 변수의 값을 visited 배열에 추가한다.
    visited << current
  end
  visited
end

graph = UndirectedGraph.new

7.times { graph.add_vertex }

graph.add_edge([0, 1], [0, 2], [1, 3], [2, 4], [2, 5], [4, 6])
graph.add_edge([0, 1])

p bfs(graph)