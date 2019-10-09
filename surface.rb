class Surface
  attr_reader :top_x, :top_y, :bottom_x, :bottom_y

  def initialize(coordinates)
    @bottom_x = 0
    @bottom_y = 0 
    @top_x = coordinates.split[0].to_i
    @top_y = coordinates.split[1].to_i
  end

  def set_robot_location(robot)
    # puts "x: #{robot.position.x}, y: #{robot.position.y}"
  end
end
