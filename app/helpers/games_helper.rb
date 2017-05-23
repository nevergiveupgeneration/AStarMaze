module GamesHelper
  def point(game, x, y)
    point = game.points.find_by(x: x, y: y)
    return nil unless point
    if point.start
      %{<div class="point start #{x}_#{y}"></div>}.html_safe
    elsif point.goal
      %{<div class="point goal #{x}_#{y}"></div>}.html_safe
    elsif point.busy
      %{<div class="point busy #{x}_#{y}"></div>}.html_safe
    elsif is_path? point
      %{<div class="point path #{x}_#{y}"></div>}.html_safe
    else
      %{<div class="point #{x}_#{y}"></div>}.html_safe
    end
  end

  private

    def is_path? point
      path = point.game.path
      true if path.include?([point.x, point.y])
    end
end
