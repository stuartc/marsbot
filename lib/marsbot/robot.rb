# frozen_string_literal: true

class Marsbot
  class Robot
    attr_reader :x, :y, :direction, :instructions

    def initialize(x:, y:, direction:, instructions:)
      @x = x
      @y = y
      @direction = direction
      @instructions = instructions
    end
  end
end
