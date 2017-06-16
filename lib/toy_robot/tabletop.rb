module ToyRobot
  class TableTop
    attr_accessor :dimentions, :toy
    def initialize
      @dimentions = { x: 5, y: 5 }
    end

    def place(direction, position)
      return if invalid_position?(position)
      @toy = Toy.new(direction, position)
    end

    def move
      return unless @toy

      x = @toy.position[:x] + @toy.direction.x
      y = @toy.position[:y] + @toy.direction.y
      return if invalid_position?(x: x, y: y)

      @toy.move
    end

    def invalid_position?(x: x, y: y)
      (x > @dimentions[:x] || x < 0) || (y > @dimentions[:y] || y < 0)
    end

    def left
      return unless @toy
      @toy.rotate 'LEFT'
    end

    def right
      return unless @toy
      @toy.rotate 'RIGHT'
    end

    def report
      return unless @toy
      direction = DIRECTIONS.select { |_k, v| v.x == @toy.direction.x && v.y == @toy.direction.y }.keys[0]
      puts "At #{@toy.position}, facing #{direction}"
    end
  end
end