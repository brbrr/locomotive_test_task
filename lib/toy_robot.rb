require 'toy_robot/version'
require 'toy_robot/input_reader'
require 'toy_robot/vector'
require 'toy_robot/toy'
require 'toy_robot/tabletop'

module ToyRobot
  # TODO: get rid off global constants
  DIRECTIONS2 = {
    NORTH: Vector.new(0, 1),
    SOUTH: Vector.new(0, -1),
    WEST:  Vector.new(-1, 0),
    EAST:  Vector.new(1, 0)
  }.freeze

  DIRECTIONS = {
    NORTH: [0, 1],
    EAST:  [1, 0],
    SOUTH: [0, -1],
    WEST:  [-1, 0]
  }.freeze


  def self.run(actions)
    @tabletop = TableTop.new
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
