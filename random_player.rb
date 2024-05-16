require './base_player.rb'

class RandomPlayer < BasePlayer
  def initialize(game:, name:)
    super
    @visited = {}
  end

  def next_point(time:)
    # 获取所有尚未访问过的点
    unvisited_points = grid.points.keys - @visited.keys

    # 如果所有的点都已经访问过，那么选择一个随机点
    if unvisited_points.empty?
      move = {
        row: rand(0..grid.max_row),
        col: rand(0..grid.max_col)
      }
    else
      # 否则，随机选择一个尚未访问过的点
      move = unvisited_points.sample
    end

    # 标记选择的点为已访问
    @visited[move] = true

    puts "Player #{name} at #{time} to #{move}"

    move
  end

  def grid
    game.grid
  end
end
