require 'spec_helper'

describe Marsbot::Robot do

  describe "#validate" do
    let(:defaults) { { x: 1, y: 2, direction: "N", instructions: "LLFFFLFLFL" } }

    context "instructions can't be F O O" do
      subject { described_class.new({**defaults, instructions: %w(F O O)}).validate }

      it { is_expected.to eql false }
    end

    context "instructions can be L F R" do
      subject { described_class.new({**defaults, instructions: %w(L F R)}).validate }

      it { is_expected.to eql true }
    end
    
  end
end

