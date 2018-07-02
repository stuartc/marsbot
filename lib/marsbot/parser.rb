# frozen_string_literal: true

class Marsbot
  class Parser
    Result = Struct.new(:extents, :robots) 

    class << self
      def parse(input)
        lines = input.split("\n")

        extents = lines[0].split(' ').map(&:to_i)

        robot_lines = lines[1..-1].reject(&:empty?)

        starting_positions =
          robot_lines.select.with_index { |l,i| i.even? }
        instructions =
          robot_lines.select.with_index { |l,i| i.odd? }

        robots = starting_positions.zip(instructions).map(&method(:to_robot))

        Result.new(extents, robots)
      end

      private

      def to_robot(details)
        x, y, direction = details[0].split(' ')
        instructions = details[1].split('')

        Robot.new(
          x: x.to_i,
          y: y.to_i,
          direction: direction,
          instructions: instructions
        )
      end
    end
  end
end
