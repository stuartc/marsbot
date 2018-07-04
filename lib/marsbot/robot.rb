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
      instructions_valid?
    end

    private

    def instructions_valid?
      instructions.is_a?(Array) && instructions.all? { |i| %w(L R F).include?(i) }
    end
  end
end
