module ToyRobot
  class TableTop
    attr_accessor :dimentions, :toy
    def initialize
      @dimentions = { x: 5, y: 5 }
    end

    def place(direction, position)
      # TODO: Validate placing position
      @toy = Toy.new(direction, position)
    end

    def move
      return unless @toy

      x = @toy.position[:x] + @toy.direction.x
      y = @toy.position[:y] + @toy.direction.y
      return if (x > @dimentions[:x] || x < 0) || (y > @dimentions[:y] || y < 0)

      @toy.move
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
      direction = DIRECTIONS.select { |_k,v| v.x == q.x && v.y == q.y }.keys[0]
      puts "At #{@toy.position}, facing #{direction}"
    end


    
  end
end