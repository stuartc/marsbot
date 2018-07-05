# frozen_string_literal: true

class Marsbot
  class World
    attr_reader :plane, :robots, :states

    def initialize(plane:)
      @plane = plane
      @robots = []
    end

    def <<(robot)
      @robots << process(robot)
    end

    def process(robot)
      robot.instructions.each_with_object(robot) do |instruction, r|
        case instruction
        when 'F'
          r.forward
        when 'L'
          r.turn_left
        when 'R'
          r.turn_right
        end
      end
    end

    def out_of_bounds; end
  end
end
