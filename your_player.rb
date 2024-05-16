require './base_player.rb'

class YourPlayer < BasePlayer
  def initialize(game:, name:)
    super
    @visited = {}
  end

  def next_point(time:)
    current_position = game.current_position(self)
    adjacent_points = grid.adjacent_points(current_position)

    # 选择一个尚未访问过的相邻点
    next_point = adjacent_points.find { |point| !@visited[point] }

    # 如果所有相邻点都已经访问过，那么选择一个尚未访问过的点，该点与当前位置的距离最近
    if next_point.nil?
      unvisited_points = grid.points.keys - @visited.keys
      next_point = unvisited_points.min_by { |point| grid.distance(current_position, point) }
    end

    # 标记选择的点为已访问
    @visited[next_point] = true

    next_point
  end

  def grid
    game.grid
  end
end
