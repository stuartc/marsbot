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
        plane: instance_of(Marsbot::Plane) && have_attributes(
          x: 5, y: 3
        ),
        robots: contain_exactly(
          instance_of(Marsbot::Robot) && have_attributes(
            x: 1, y: 1, orientation: "E",
            instructions: "RFRFRFRF".chars
          ),
          instance_of(Marsbot::Robot) && have_attributes(
            x: 3, y: 2, orientation: "N",
            instructions: "FRRFLLFFRRFLL".chars
          ),
          instance_of(Marsbot::Robot) && have_attributes(
            x: 0, y: 3, orientation: "W",
            instructions: "LLFFFLFLFL".chars
          )
        )
      )
    end
  end
end
