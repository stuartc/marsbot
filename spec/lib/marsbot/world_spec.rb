# frozen_string_literal: true

require 'spec_helper'

describe Marsbot::World do
  let(:plane) { Marsbot::Plane.new(x: 5, y: 3) }
  let(:robot) do
    Marsbot::Robot.new(x: 2, y: 2, orientation: 'N', instructions: %w[F])
  end
  let(:world) { described_class.new(plane: plane) }

  # describe '#<< robot' do
  #   before { world << robot }

  #   it 'moves a robot' do
  #     expect(world.robots).to contain_exactly(
  #       have_attributes(x: 3, y: 2, orientation: 'N')
  #     )
  #   end
  # end

  describe 'tracker' do
    let(:robots) do
      [
        Marsbot::Robot.new(
          x: 1, y: 1, orientation: "E",
          instructions: "RFRFRFRF".chars
        ),
        Marsbot::Robot.new(
          x: 3, y: 2, orientation: "N",
          instructions: "FRRFLLFFRRFLL".chars
        ),
        Marsbot::Robot.new(
          x: 0, y: 3, orientation: "W",
          instructions: "LLFFFLFLFL".chars
        )
      ]
    end

    before do
      robots.each do |robot|
        world << robot
      end
    end

    it do
      world.robots.map do |robot|
        puts "#{robot.coordinates.join(' ')} #{robot.orientation}"
      end
      expect(world.tracker.out_of_bounds).to contain_exactly(robots[1])

    end
  end
end
