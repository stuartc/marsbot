# frozen_string_literal: true

class Marsbot
  class Parser
    Result = Struct.new(:plane, :robots)

    class << self
      def parse(input)
        lines = input.split("\n")

        plane = to_plane(lines[0].split(' ').map(&:to_i))

        robot_lines = lines[1..-1].reject(&:empty?)

        starting_positions =
          robot_lines.select.with_index { |_l, i| i.even? }
        instructions =
          robot_lines.select.with_index { |_l, i| i.odd? }

        robots = starting_positions.zip(instructions).map(&method(:to_robot))

        Result.new(plane, robots)
      end

      private

      def to_robot(details)
        x, y, orientation = details[0].split(' ')
        instructions = details[1].chars

        Robot.new(
          x: x.to_i,
          y: y.to_i,
          orientation: orientation,
          instructions: instructions
        )
      end

      def to_plane((x, y))
        Plane.new(x: x.to_i, y: y.to_i)
      end
    end
  end
end
