require_relative 'models/surface'
require_relative 'models/robot'

class MarsExplore
  def self.explore(file)
    return if file.nil?
    return unless file.is_a?(::File) || file.is_a?(::Tempfile)
    return if file.closed?

    surface_description = file.readline
    surface = Surface.new(surface_description)

    robot_id = 0
    current_robot = nil

    file.each_with_index do |line, index|
      if index % 2 == 0
        current_robot = Robot.new(robot_id, line, surface)
        puts "Created Robot #{current_robot.id} at x: #{current_robot.position.x}, y: #{current_robot.position.y}, direction: #{current_robot.direction.current}"
      else
        current_robot.handle_instructions(line)
        surface.set_robot_location(current_robot)
        puts "Robot #{current_robot.id} stopped at x: #{current_robot.position.x}, y: #{current_robot.position.y}, direction: #{current_robot.direction.current}"
        puts
        robot_id += 1
      end
    end

    surface
  end
end