module ToyRobot
  class Toy
    attr_accessor :position, :direction

    def initialize(direction, position)
      @direction = DIRECTIONS[direction.to_sym].dup
      @position = position.dup
    end

    def move
      # @position = @position.merge!(dir) { |_, old_val, new_val| old_val + new_val }
      @position[:x] += @direction.x
      @position[:y] += @direction.y
    end

    def rotate(direction)
      @direction.rotate(direction)
    end
  end
end