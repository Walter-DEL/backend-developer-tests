# your_player.rb

require './base_player.rb'

class YourPlayer < BasePlayer
  def next_point(time:)
    # 获取当前玩家的位置
    current_position = game.current_position(self)

    # 获取所有相邻的点
    adjacent_points = grid.adjacent_points(current_position)

    # 选择下一个要访问的点（示例：随机选择一个相邻点）
    next_point = adjacent_points.sample

    # 返回坐标
    next_point
  end

  def grid
    game.grid
  end
end
