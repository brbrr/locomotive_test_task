require 'spec_helper'

RSpec.describe ToyRobot do
  it 'has a version number' do
    expect(ToyRobot::VERSION).not_to be nil
  end

  it 'manipulates the toy with move' do
    actions = ['PLACE 0,0,NORTH',
               'MOVE',
               'REPORT']
    expect do
      ToyRobot.run(actions)
    end.to output("0,1,NORTH\n").to_stdout
  end

  it 'manipulates the toy with rotation' do
    actions = ['PLACE 0,0,NORTH',
               'LEFT',
               'REPORT']
    expect do
      ToyRobot.run(actions)
    end.to output("0,0,WEST\n").to_stdout
  end

  it 'manipulates the toy in complex way' do
    actions = ['PLACE 0,0,NORTH',
               'MOVE',
               'MOVE',
               'RIGHT',
               'MOVE',
               'MOVE',
               'RIGHT',
               'LEFT',
               'LEFT',
               'REPORT']
    expect do
      ToyRobot.run(actions)
    end.to output("2,2,NORTH\n").to_stdout
  end

  it 'ignores everything until placed' do
    actions = ['MOVE',
               'RIGHT',
               'LEFT',
               'REPORT',
               'PLACE 2,2,NORTH',
               'REPORT']
    expect do
      ToyRobot.run(actions)
    end.to output("2,2,NORTH\n").to_stdout
  end

  it 'can run from file' do
    expect do
      ToyRobot.run_from_file('spec/support/actions.txt')
    end.to output("2,3,SOUTH\n2,3,NORTH\n0,3,WEST\n").to_stdout
  end

  it 'can run from STDIN' do
    allow(STDIN).to receive(:gets).and_return('PLACE 3,3,WEST', 'MOVE', 'LEFT', 'REPORT', "\n")
    expect do
      ToyRobot.run_from_stdin
    end.to output("2,3,SOUTH\n").to_stdout
  end
end
