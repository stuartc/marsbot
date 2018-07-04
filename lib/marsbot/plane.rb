# frozen_string_literal: true

class Marsbot
  class Plane
    attr_reader :x, :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end

    def validate
      coordinates_valid?
    end

    private

    def coordinates_valid?
      x.is_a?(Integer) && y.is_a?(Integer)
    end
  end
end

