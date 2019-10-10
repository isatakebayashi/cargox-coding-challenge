class Direction
  attr_reader :current 
  
  def initialize(dir)
    @current = dir
  end

  def change(direction)
    rotate_left if direction == 'L'
    rotate_rigth if direction == 'R'
  end

  private

  def rotate_left
    case @current
    when 'N'
      @current = 'W'
    when 'W'
      @current = 'S'
    when 'S'
      @current = 'E'
    when 'E'
      @current = 'N'
    end
  end

  def rotate_rigth
    case @current
    when 'N'
      @current = 'E'
    when 'E'
      @current = 'S'
    when 'S'
      @current = 'W'
    when 'W'
      @current = 'N'
    end
  end
end
