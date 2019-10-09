require_relative 'direction'
require_relative 'position'

class Robot
  attr_reader :position,:direction, :id
  VALID_INSTRUCTIONS = ['L', 'R', 'M']

  def initialize(id, initial_data, surface)
    x = initial_data.split[0]
    y = initial_data.split[1]
    @id="#{id}"
    @direction = Direction.new(initial_data.split[2])
    @surface = surface
    @position = Position.new(x, y, @surface)
  end

  def parse_intial_data(data)
  end

  def handle_instructions(instructions)
    x = instructions.split("")
    x.each do |i|
      next unless valid_instruction?(i)
      @direction.change(i) if is_change_direction?(i)
      if is_position_change?(i)
        moved = @position.move(@direction)
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
