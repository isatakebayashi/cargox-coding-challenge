
require_relative 'surface'
require_relative 'robot'

current_robot = nil
robots = []
i = 1

ARGF.each do |line|
  surface = Surface.new(line)

    if #numero de linhas restantes / 2 == 0
      current_robot = Robot.new(i, line, surface)
    else 
      current_robot.handle_instructions(line)
    end
    robots << current_robot
    i += 1
end