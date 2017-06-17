module ToyRobot
  class TableTop
    attr_accessor :dimentions, :toy
    def initialize
      @dimentions = { x: 5, y: 5 }
    end

    # NOTE: Expected only valid actions
    def call(action)
      splited = action.split(/[,\s]/)
      method = splited[0].downcase
      return send(method) if splited[1].nil?

      direction = splited[3]
      position = { x: splited[1].to_i, y: splited[2].to_i }
      send(method, direction, position)
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

    def invalid_position?(cords)
      (cords[:x] > @dimentions[:x] || cords[:x] < 0) || (cords[:y] > @dimentions[:y] || cords[:y] < 0)
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
      direction = DIRECTIONS.select do |_k, vect|
        vect.x == @toy.direction.x && vect.y == @toy.direction.y
      end.keys[0]
      puts "#{@toy.position[:x]},#{@toy.position[:y]},#{direction}"
    end
  end
end