# frozen_string_literal: true

class Marsbot
  class World
    attr_reader :plane, :robots, :tracker

    def initialize(plane:)
      @plane = plane
      @robots = []
      @tracker = Tracker.new(plane: plane)
    end

    def <<(robot)
      @robots << process(robot)
    end

    def process(robot)
      tracker.process(robot)
    end
  end
end
