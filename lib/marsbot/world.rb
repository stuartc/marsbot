# frozen_string_literal: true

class Marsbot
  class World
    attr_reader :plane, :robots, :states

    def initialize(plane:)
      @plane = plane
      @states = []
    end

    def <<(robot)
      @states << process(robot)
    end

    def process(robot)
      robot.instructions.each_with_object(robot) do |instruction, state|
        case instruction
        when 'F'
          case state.orientation
          when 'N'
            state.x += 1
          when 'S'
            state.x += -1
          when 'E'
            state.y += 1
          when 'W'
            state.y += -1
          end
        when 'L'
        when 'R'
        end
      end
    end
  end
end
