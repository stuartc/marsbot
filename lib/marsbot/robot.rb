# frozen_string_literal: true

class Marsbot
  class Robot
    attr_accessor :x, :y, :orientation, :instructions

    def initialize(x:, y:, orientation:, instructions:)
      @x = x
      @y = y
      @orientation = orientation
      @instructions = instructions
    end

    def validate
      instructions_valid? && orientation_valid? && coordinates_valid?
    end

    private

    def instructions_valid?
      instructions.is_a?(Array) && instructions.all? { |i| %w[L R F].include?(i) }
    end

    def orientation_valid?
      orientation.is_a?(String) && %w[N S E W].include?(orientation)
    end

    def coordinates_valid?
      x.is_a?(Integer) && y.is_a?(Integer)
    end
  end
end
