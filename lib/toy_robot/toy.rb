module ToyRobot
  class Toy
    attr_accessor :position, :direction

    DIRECTIONS = {
      NORTH: [0, 1],
      EAST:  [1, 0],
      SOUTH: [0, -1],
      WEST:  [-1, 0]
    }.freeze

    ROTATION = { LEFT: -1, RIGHT: 1 }.freeze


    def initialize(direction, position)
      # @direction = DIRECTIONS[direction.to_sym].dup
      @direction = DIRECTIONS.fetch(direction.to_sym)
      @position = position.dup
    end

    def move
      # @position = @position.merge!(dir) { |_, old_val, new_val| old_val + new_val }
      @position[0] += @direction[0]
      @position[1] += @direction[1]
    end

    def rotate(to)
      id = DIRECTIONS.values.index(@direction)
      new_id = id + ROTATION.fetch(to.to_sym)
      new_id = 0 if new_id > 3
      new_id = 3 if new_id < 0
      @direction = DIRECTIONS.values[new_id]
    end

    def direction_name
      DIRECTIONS.select do |_k, cords|
        cords[0] == @toy.direction[0] && cords[0] == @toy.direction[1]
      end.keys[0]
    end
  end
end