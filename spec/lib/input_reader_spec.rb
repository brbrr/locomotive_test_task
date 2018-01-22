require 'spec_helper'


module ToyRobot
  RSpec.describe InputReader do
    it 'reads from file' do
      path = 'spec/support/actions.txt'
      expect(InputReader.from_file(path)).to eq File.read(path).split("\n")
    end

    it 'reads from STDIN' do
      allow(STDIN).to receive(:gets).and_return('PLACE 3,3,WEST', 'MOVE', 'LEFT', 'REPORT', "\n")
      expect(InputReader.from_stdin).to eq ['PLACE 3,3,WEST', 'MOVE', 'LEFT', 'REPORT']
    end
  end
end