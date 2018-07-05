require 'spec_helper'

describe Marsbot::Robot do
  let(:defaults) { { x: 1, y: 2, orientation: 'N', instructions: 'LLFFFLFLFL'.chars } }
  describe '#validate' do
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

  describe '#forward' do
    let(:robot) { described_class.new(**defaults, orientation: orientation) }

    before { robot.forward }

    subject { robot.coordinates }
    context 'north facing' do
      let(:orientation) { 'N' }
      it { is_expected.to eql [2, 2] }
    end

    context 'south facing' do
      let(:orientation) { 'S' }
      it { is_expected.to eql [0, 2] }
    end

    context 'east facing' do
      let(:orientation) { 'E' }
      it { is_expected.to eql [1, 3] }
    end

    context 'west facing' do
      let(:orientation) { 'W' }
      it { is_expected.to eql [1, 1] }
    end
  end

  describe '#turn_left' do
    let(:robot) { described_class.new(**defaults, orientation: orientation) }

    before { robot.turn_left }

    subject { robot.orientation }
    context 'north facing' do
      let(:orientation) { 'N' }
      it { is_expected.to eql 'W' }
    end

    context 'south facing' do
      let(:orientation) { 'S' }
      it { is_expected.to eql 'E' }
    end

    context 'east facing' do
      let(:orientation) { 'E' }
      it { is_expected.to eql 'N' }
    end

    context 'west facing' do
      let(:orientation) { 'W' }
      it { is_expected.to eql 'S' }
    end
  end

  describe '#turn_right' do
    let(:robot) { described_class.new(**defaults, orientation: orientation) }

    before { robot.turn_right }

    subject { robot.orientation }
    context 'north facing' do
      let(:orientation) { 'N' }
      it { is_expected.to eql 'E' }
    end

    context 'south facing' do
      let(:orientation) { 'S' }
      it { is_expected.to eql 'W' }
    end

    context 'east facing' do
      let(:orientation) { 'E' }
      it { is_expected.to eql 'S' }
    end

    context 'west facing' do
      let(:orientation) { 'W' }
      it { is_expected.to eql 'N' }
    end
  end
end
