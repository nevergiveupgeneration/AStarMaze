class Game < ApplicationRecord
  attr_writer :path

  has_many :points

  validates :title, presence: true

  after_create do
    10.times do |n|
      10.times do |k|
        if n == 0 && k == 0
          points.create(x: n, y: k, start: true)
        elsif  n == 9 && k == 9
          points.create(x: n, y: k, goal: true)
        else
          points.create(x: n, y: k)
        end
      end
    end
  end

  def path
    @path ||= find_path
  end

  def find_path
    start = points.find_by(start: true)
    goal = points.find_by(goal: true)
    frontier = PQueue.new(){ |a,b| a.cost < b.cost }
    frontier.push(start)
    came_from = { start => nil }
    cost_so_far = { start => 0 }

    while !frontier.empty? do
      current = frontier.pop
      break if current == goal
      for next_point in current.neighbors
        new_cost = cost_so_far[current] + 1
        if !cost_so_far.include?(next_point) or new_cost < cost_so_far[next_point] then
            cost_so_far[next_point] = new_cost
            next_point.update_attributes(cost: new_cost + heuristic(goal, next_point))
            frontier.push(next_point)
            came_from[next_point] = current
        end
      end
    end
    return nil unless came_from[goal]

    path = []
    point = came_from[goal]
    begin
      path.unshift([point.x, point.y])
      point = came_from[point]
    end until point == start
    path
  end

  private

  def heuristic(a, b)
    (a.x - b.x).abs + (a.y - b.y).abs
  end
end
