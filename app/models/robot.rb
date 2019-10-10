require_relative 'direction'
require_relative 'position'

class Robot
  class InvalidRobotCoordinatesError < StandardError;end

  attr_reader :position,:direction, :id
  VALID_INSTRUCTIONS = ['L', 'R', 'M']

  def initialize(id, initial_data, surface)
    @id="#{id}"
    @surface = surface

    x, y, dir = parse_intial_data(initial_data)

    @position = Position.new(x, y, @surface)
    @direction = Direction.new(dir)
  end

  def parse_intial_data(data)
    rs = /\s*(?<x>\d+)\s+(?<y>\d+)\s+(?<dir>[A-Z])\s*$/
    match = rs.match(data)
    
    raise InvalidRobotCoordinatesError if match.nil?

    x = match[:x].to_i
    y = match[:y].to_i
    dir = match[:dir]

    return x, y, dir
  end

  def handle_instructions(instructions)
    instructions.each_char do |i|
      next unless valid_instruction?(i)
      @direction.change(i) if is_change_direction?(i)
      if is_position_change?(i)
        moved = @position.move(@direction.current)
        puts "Invalid move for #{direction.current} on position #{@position.x}, #{@position.y}" unless moved
      end
    end
  end

  def is_change_direction?(x)
    x == 'L' || x == 'R'
  end

  def is_position_change?(x)
    x == 'M'
  end

  def valid_instruction?(x)
    VALID_INSTRUCTIONS.include?(x)
  end
end