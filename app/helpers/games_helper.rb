module GamesHelper
  def point(path, point)
    if point.start
      %{<div class="point start p_#{point.x}_#{point.y}"></div>}.html_safe
    elsif point.goal
      %{<div class="point goal p_#{point.x}_#{point.y}"></div>}.html_safe
    elsif point.busy
      image_tag("busy", height: '32', width: '32', class: "p_#{point.x}_#{point.y}" ).html_safe
    elsif is_path? path, point
      image_tag("path", height: '32', width: '32', class: "p_#{point.x}_#{point.y}").html_safe
    else
      image_tag("point", height: '32', width: '32', class: "p_#{point.x}_#{point.y}").html_safe
    end
  end

  private

    def is_path? path, point
      true if path && path.include?([point.x, point.y])
    end
end
