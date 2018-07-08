# frozen_string_literal: true

# Tracker
# =======
#
# Steps:
#
# 1. 
class Marsbot
  class Tracker
    attr_reader :robots, :plane, :movements

    def initialize(plane:)
      @plane = plane
      @robots = []
      @movements = {}
    end

    def <<(robot)
      @robots << robot
    end

    def process(robot)
      robot.instructions.each_with_object(robot) do |instruction, r|
        puts "#{r.instructions.join('')}\t#{r.coordinates.join(' ')}\t#{instruction}\t#{next_coordinate(r, instruction)}"
        case instruction
        when 'F'
          r.coordinates = next_coordinate(r, instruction)
        when 'L'
          r.turn_left
        when 'R'
          r.turn_right
        end
      end
    end

    def out_of_bounds
      robots.select(&method(:out_of_bounds?))
    end

    def out_of_bounds?(robot)
      !(robot.x.between?(0, plane.x) && robot.y.between?(0, plane.y))
    end

    def next_coordinate(robot, instruction)
      if instruction == "F"
        case robot.orientation
        when 'N'
          [robot.x, robot.y + 1]
        when 'S'
          [robot.x, robot.y - 1]
        when 'E'
          [robot.x + 1, robot.y]
        when 'W'
          [robot.x - 1, robot.y]
        end
      else
        robot.coordinates
      end
    end

    def safe?(robot, instruction) 
      
    end
  end
end
