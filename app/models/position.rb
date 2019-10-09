class Position
  attr_reader :x, :y, :surface

  def initialize(x, y, surface)
    @x = x.to_i
    @y = y.to_i
    @surface = surface
  end

  def move(direction)
    new_x, new_y = preview_move(direction)
    return false unless can_move_to?(new_x, new_y, direction)
    @x = new_x
    @y = new_y
    true
  end

  def can_move_to?(new_x, new_y, direction)
    is_inside_surface = new_x >= surface.bottom_x &&
                      new_x <= surface.top_x &&
                      new_y >= surface.bottom_y &&
                      new_y <= surface.top_y
    no_overlap = !surface.robot_at_position?(new_x, new_y)

    is_inside_surface && no_overlap
  end

  private

  def preview_move(direction)
    new_x = x
    new_y = y

    case direction
    when 'N'
      new_y = y + 1
    when 'S'
      new_y = y - 1
    when 'W'
      new_x = x - 1
    when 'E'
      new_x = x + 1
    end

    return new_x, new_y
  end
end