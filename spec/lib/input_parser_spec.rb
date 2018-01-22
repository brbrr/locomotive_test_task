require 'spec_helper'

module ToyRobot
  RSpec.describe InputParser do
    it "parses 'PLACE 0,0,NORTH'" do
      expect(InputParser.parse('PLACE 0,0,NORTH')).to eq [:place, :NORTH, [0, 0]]
    end

    it "parses 'LEFT'" do
      expect(InputParser.parse('LEFT')).to eq [:left]
    end

    it "parses 'RIGHT'" do
      expect(InputParser.parse('RIGHT')).to eq [:right]
    end
    
    it "parses 'REPORT'" do
      expect(InputParser.parse('REPORT')).to eq [:report]
    end
  end
end