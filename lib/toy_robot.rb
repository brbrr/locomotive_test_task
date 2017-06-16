require 'toy_robot/version'
require 'toy_robot/vector'
require 'toy_robot/toy'
require 'toy_robot/tabletop'

module ToyRobot
  # Your code goes here...

  DIRECTIONS = {
      NORTH: Vector.new(0, 1),
      SOUTH: Vector.new(0, -1),
      WEST:  Vector.new(-1, 0),
      EAST:  Vector.new(1, 0)
  }.freeze

  # TODO: get rid off global constants
  ROTATION = { LEFT: 1, RIGHT: -1 }.freeze
end
