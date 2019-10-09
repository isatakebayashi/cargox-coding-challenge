class Surface
  attr_reader :top_x, :top_y, :bottom_x, :bottom_y, :robots

  def initialize(coordinates)
    @bottom_x = 0
    @bottom_y = 0
    @top_x = coordinates.split[0].to_i
    @top_y = coordinates.split[1].to_i
    @robots = []
    puts "Created surface with top_x: #{top_x} and top_y: #{top_y}"
  end

  def to_h
    robots.map do |robot|
      {
        id: robot.id,
        x: robot.position.x,
        y: robot.position.y,
        dir: robot.direction.current
      }
    end
  end

  def set_robot_location(robot)
    @robots << robot
  end

  def robot_at_position?(x, y)
    @robots.find { |item| item.position.x == x && item.position.y == y } != nil
  end
end