# frozen_string_literal: true

require 'spec_helper'

describe Marsbot::World do
  let(:plane) { Marsbot::Plane.new(x: 5, y: 5) }
  let(:robot) do
    Marsbot::Robot.new(x: 2, y: 2, orientation: 'N', instructions: %w[F])
  end

  describe '#<< robot' do
    let(:world) { described_class.new(plane: plane) }
    before { world << robot }

    it do
      expect(world.robots).to contain_exactly(
        have_attributes(x: 3, y: 2, orientation: 'N')
      )
    end
  end

  describe '#out_of_bounds' do
    let(:world) { described_class.new(plane: plane) }

    before do
      world << robot
    end

    subject { world.out_of_bounds }

    context 'when true' do
      let(:robot) do
        Marsbot::Robot.new(x: 5, y: 5, orientation: 'N', instructions: %w[F])
      end

      it { is_expected.to eql [robot] }
    end
  end
end
