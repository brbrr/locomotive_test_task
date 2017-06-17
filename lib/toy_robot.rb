require 'toy_robot/version'
require 'toy_robot/vector'
require 'toy_robot/toy'
require 'toy_robot/tabletop'

module ToyRobot
  # TODO: get rid off global constants
  DIRECTIONS = {
    NORTH: Vector.new(0, 1),
    SOUTH: Vector.new(0, -1),
    WEST:  Vector.new(-1, 0),
    EAST:  Vector.new(1, 0)
  }.freeze

  ROTATION = { LEFT: 1, RIGHT: -1 }.freeze


  def self.run(actions)
    @tabletop = TableTop.new
    actions.each do |action|
      @tabletop.call(action)
    end
  end
end
