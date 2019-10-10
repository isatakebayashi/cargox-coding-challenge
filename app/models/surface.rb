class Surface
  class InvalidSurfaceCoordinatesError < StandardError;end

  attr_reader :top_x, :top_y, :bottom_x, :bottom_y, :robots

  def initialize(coordinates)
    @bottom_x = 0
    @bottom_y = 0
    @robots = []

    parse_coordinates(coordinates)
    
    puts "Created surface with top_x: #{top_x} and top_y: #{top_y}"
  end

  def parse_coordinates(data)
    rs = /\s*(?<x>\d+)\s+(?<y>\d+)\s*$/
    coordinates = rs.match(data)
    
    raise InvalidSurfaceCoordinatesError if coordinates.nil?
    
    @top_x = coordinates[:x].to_i
    @top_y = coordinates[:y].to_i
  end

  def to_h
    robot_list = robots.map do |robot|
      {
        id: robot.id,
        x: robot.position.x,
        y: robot.position.y,
        dir: robot.direction.current
      }
    end
    
    {
      x: top_x,
      y: top_y,
      robots: robot_list
    } 
  end

  def set_robot_location(robot)
    @robots << robot
  end

  def robot_at_position?(x, y)
    @robots.find { |item| item.position.x == x && item.position.y == y } != nil
  end
end