require 'spec_helper'

describe Marsbot::Parser do

  let(:input) do
    <<~EOS
    5 3
    1 1 E
    RFRFRFRF

    3 2 N
    FRRFLLFFRRFLL

    0 3 W
    LLFFFLFLFL
    EOS
  end

  describe ".parse" do
    subject { described_class.parse(input) }
    it do
      is_expected.to have_attributes(
        extents: [5,3],
        robots: contain_exactly(
          instance_of(Marsbot::Robot) && have_attributes(
            x: 1, y: 1, direction: "E",
            instructions: "RFRFRFRF".split('')
          ),
          instance_of(Marsbot::Robot) && have_attributes(
            x: 3, y: 2, direction: "N",
            instructions: "FRRFLLFFRRFLL".split('')
          ),
          instance_of(Marsbot::Robot) && have_attributes(
            x: 0, y: 3, direction: "W",
            instructions: "LLFFFLFLFL".split('')
          )
        )
      )
    end
  end
end
