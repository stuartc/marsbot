# frozen_string_literal: true

require 'spec_helper'

describe Marsbot::Tracker do
  let(:plane) { Marsbot::Plane.new(x: 5, y: 3) }
  let(:tracker) { described_class.new(plane: plane) }

  describe '#out_of_bounds' do

    before do
      tracker << robot
    end

    subject { tracker.out_of_bounds }

    context 'when true' do
      let(:robot) do
        Marsbot::Robot.new(x: 6, y: 5, orientation: 'N', instructions: %w[F])
      end

      it { is_expected.to eql [robot] }
    end
  end

  describe "#next_coordinate" do
    let(:robot) do
      Marsbot::Robot.new(x: 3, y: 5, orientation: 'N', instructions: %w[F])
    end
    subject { tracker.next_coordinate(robot, instruction) }

    context 'going forward' do
      let(:instruction) { "F" }
      it { is_expected.to eql [3,6] }
    end

    context 'changing direction' do
      let(:instruction) { "L" }
      it { is_expected.to eql [3,5] }
    end
  end

  describe 'moving' do
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

    it do
      robots.map do |robot|
        tracker.process(robot)
        # puts "#{robot.coordinates.join(' ')} #{robot.orientation}"
      end
      expect(tracker.out_of_bounds).to contain_exactly(robots[1])

    end
  end
end
