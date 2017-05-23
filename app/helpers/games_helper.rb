module GamesHelper
  def point(game, x, y)
    point = game.points.find_by(x: x, y: y)
    return nil unless point
    if point.start
      %{<div class="point start p_#{x}_#{y}"></div>}.html_safe
    elsif point.goal
      %{<div class="point goal p_#{x}_#{y}"></div>}.html_safe
    elsif point.busy
      %{<div class="point busy p_#{x}_#{y}"></div>}.html_safe
    elsif is_path? point
      %{<div class="point path p_#{x}_#{y}"></div>}.html_safe
    else
      %{<div class="point p_#{x}_#{y}"></div>}.html_safe
    end
  end

  private

    def is_path? point
      path = point.game.path
      true if path && path.include?([point.x, point.y])
    end
end
