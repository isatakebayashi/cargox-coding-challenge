class Position
  attr_reader :x, :y, :surface

  def initialize(x, y, surface)
    @x = x.to_i
    @y = y.to_i
    @surface = surface
  end

  def move(direction)
    # new_y = ?
    # new_x = ?
    case direction
    when 'N'
      @y = y + 1
    when 'S'
      @y = y - 1
    when 'W'
      @x = x - 1
    when 'E'
      @x = x + 1
    end
  end

  def can_move_to?(direction)
  end
  
end