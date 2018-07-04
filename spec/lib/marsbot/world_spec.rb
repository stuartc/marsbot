require 'spec_helper'

describe Marsbot::World do
  describe '#<< robot' do
    let(:plane) { Marsbot::Plane.new(x: 5, y: 5) }
    let(:robot) { Marsbot::Robot.new(x: 2, y: 2, orientation: 'N', instructions: %w[F]) }

    let(:world) { described_class.new(plane: plane) }
    before { world << robot }

    it do
      expect(world.states).to contain_exactly(
        have_attributes(x: 3, y: 2, orientation: 'N')
      )
    end
  end
end
