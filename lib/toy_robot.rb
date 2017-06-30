require 'toy_robot/version'
require 'toy_robot/input_reader'
require 'toy_robot/vector'
require 'toy_robot/toy'
require 'toy_robot/toy_driver'

module ToyRobot
  def self.run(actions)
    @tabletop = ToyDriver.new
    actions.each do |action|
      @tabletop.call(action)
    end
  end

  def self.run_from_file(path)
    run InputReader.from_file(path)
  end

  def self.run_from_stdin
    run InputReader.from_stdin
  end
end
