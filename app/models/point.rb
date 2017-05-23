class Point < ApplicationRecord
  belongs_to :game

  def neighbors
  dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  result = []
  dirs.each do |dir|
    neighbor = game.points.where( x: x + dir[0],
                                          y: y + dir[1], busy: false).first
    result.push(neighbor) if neighbor
  end
  return result
end
end
