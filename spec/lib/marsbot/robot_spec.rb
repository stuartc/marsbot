require 'spec_helper'

describe Marsbot::Robot do
  describe '#validate' do
    let(:defaults) { { x: 1, y: 2, orientation: 'N', instructions: 'LLFFFLFLFL'.chars } }

    context "instructions can't be F O O" do
      subject { described_class.new(**defaults, instructions: %w[F O O]).validate }

      it { is_expected.to eql false }
    end

    context 'instructions can be L F R' do
      subject { described_class.new(**defaults, instructions: %w[L F R]).validate }

      it { is_expected.to eql true }
    end

    %w[N S E W].each do |orientation|
      context 'orientation' do
        subject { described_class.new(**defaults, orientation: orientation).validate }

        it "can be #{orientation}" do
          is_expected.to eql true
        end
      end
    end

    %w[A O D].each do |orientation|
      context 'orientation' do
        subject { described_class.new(**defaults, orientation: orientation).validate }

        it "can't be #{orientation}" do
          is_expected.to eql false
        end
      end
    end
  end
end
