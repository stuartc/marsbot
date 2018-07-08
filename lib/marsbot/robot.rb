# frozen_string_literal: true

class Marsbot
  class Robot
    CARDINAL_POINTS = %w[N E S W].freeze
    attr_accessor :x, :y, :orientation, :instructions

    def initialize(x:, y:, orientation:, instructions:)
      @x = x
      @y = y
      @orientation = orientation
      @instructions = instructions
    end

    def forward
      case orientation
      when 'N'
        self.y += 1
      when 'S'
        self.y += -1
      when 'E'
        self.x += 1
      when 'W'
        self.x += -1
      end
    end

    def coordinates
      [x, y]
    end

    def coordinates=(coords)
      self.x = coords[0]
      self.y = coords[1]
    end

    def turn_left
      cardinal_index = CARDINAL_POINTS.index { |p| p == orientation }
      self.orientation = CARDINAL_POINTS[cardinal_index - 1]
    end

    def turn_right
      cardinal_index = CARDINAL_POINTS.reverse.index { |p| p == orientation }
      self.orientation = CARDINAL_POINTS.reverse[cardinal_index - 1]
    end

    def validate
      instructions_valid? && orientation_valid? && coordinates_valid?
    end

    private

    def instructions_valid?
      instructions.is_a?(Array) &&
        instructions.all? { |i| %w[L R F].include?(i) }
    end

    def orientation_valid?
      orientation.is_a?(String) && CARDINAL_POINTS.include?(orientation)
    end

    def coordinates_valid?
      x.is_a?(Integer) && y.is_a?(Integer)
    end
  end
end
