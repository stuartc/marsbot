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

    def validate
      instructions_valid? && direction_valid? && coordinates_valid?
    end

    private

    def instructions_valid?
      instructions.is_a?(Array) && instructions.all? { |i| %w(L R F).include?(i) }
    end

    def direction_valid?
      direction.is_a?(String) && %w(N S E W).include?(direction)
    end

    def coordinates_valid?
      x.is_a?(Integer) && y.is_a?(Integer)
    end
  end
end
