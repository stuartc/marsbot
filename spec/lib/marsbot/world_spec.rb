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

end
