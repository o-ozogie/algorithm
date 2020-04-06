# 무방향 그래프, DFS 구현할 때 쓰길래 대충 만들었다. 방향과 비용을 설정할 수 있는 그래프는 따로 만들었다.
class UndirectedGraph
  attr_accessor :vertex_list, :edge_list, :adjacency_list
  # 객체를 생성하면 정점 리스트, 간선 리스트, 인접 리스트와 count를 초기화 한다.
  def initialize
    @vertex_list = []
    @edge_list = []
    @adjacency_list = []

    @count = 0
  end

  # 정점 추가 메소드. 0부터 순차적으로 정점을 생성한다. 정점에 변화가 있으므로 인접 리스트를 갱신한다.
  def add_vertex
    @vertex_list << @count
    @count += 1
    adjacency_list
  end

  # 간선 추가 메소드. 정점 두 개가 담긴 배열을 가변인자로 받는다.
  # 유효하지 않은 정점을 받았을 경우 간선을 추가하지 않으며, 간선의 중복값ㅇ르 걸러낸다.
  def add_edge(*args)
    args.each do |arg|
      next unless @vertex_list.include?(arg[0]) && @vertex_list.include?(arg[1])

      @edge_list << [@vertex_list[arg[0]], @vertex_list[arg[1]]]
      @edge_list << [@vertex_list[arg[1]], @vertex_list[arg[0]]]
    end

    @edge_list = @edge_list.uniq
    adjacency_list
  end

  # 정점 삭제 메소드. 정점을 포함하고 있는 간선부터 삭제한 후 정점 리스트의 마지막 정점을 삭제한다.
  def remove_vertex
    @edge_list = @edge_list.reject { |edge| edge.include?(@vertex_list[-1]) }

    @vertex_list.delete_at(@vertex_list[-1])
    adjacency_list
  end

  # 간선 삭제 메소드. 정점 두 개를 받아서 해당 정점을 포함하는 간선을 삭제한다.
  def remove_edge(vertex1, vertex2)
    @edge_list = @edge_list.reject do |edge|
      edge.include?(vertex1) && edge.include?(vertex2)
    end

    adjacency_list
  end

  # 인접 리스트 생성 메소드.
  # 인접 리스트 배열을 초기화하고 빈 배열 내에 정점의 수만큼 빈 배열을 추가한 후,
  # 간선 리스트를 순회하며 간선의 0번 인덱스의 값에 해당하는 배열 내에
  # 간선의 1번 인덱스의 값에 해당하는 배열을 넣는다.
  # 코드를 보는게 이해하기 훨씬 쉬울 것이다.
  def adjacency_list
    @adjacency_list = []
    @vertex_list.each { @adjacency_list << [] }

    @edge_list.each do |edge|
      @adjacency_list[edge[0]] << edge[1]
    end

    @adjacency_list
  end

  def show_graph
    p "vertex list: #{@vertex_list}"
    p "edge_list: #{@edge_list}"
    p "adjacency_list: #{@adjacency_list}"
    puts "\n"
  end
end

if __FILE__ == $PROGRAM_NAME
  graph = UndirectedGraph.new

  7.times { graph.add_vertex }
  graph.add_edge([0, 1], [0, 2], [1, 3], [2, 4], [2, 5], [4, 6])
  graph.add_edge([0, 1])
  graph.show_graph

  graph.remove_vertex
  graph.show_graph

  graph.remove_edge(2, 4)
  graph.show_graph
end