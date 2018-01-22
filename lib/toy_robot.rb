require 'toy_robot/version'
require 'toy_robot/input_reader'
require 'toy_robot/input_parser'
require 'toy_robot/toy'
require 'toy_robot/toy_driver'

  # TODO: Remove coupling from #run_from_*, replace with DI?
  # Wrap below methods with Class

module ToyRobot
  def self.run(actions, parser = InputParser)
    @tabletop = ToyDriver.new
    # Refactor InputParser to use instanse methods
    # then just reuse single instance.
    # parser = InputParser.new
    actions.each do |action|
      @tabletop.call(parser.parse(action))
    end
  end

  def self.run_from_file(path)
    run InputReader.from_file(path)
  end

  def self.run_from_stdin
    run InputReader.from_stdin
  end
end
