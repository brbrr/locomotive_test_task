module ToyRobot
  class ToyDriver
    attr_accessor :dimentions, :toy
    def initialize
      @dimentions = [5, 5]
    end

    # NOTE: Expected only valid actions
    def call(action)
      splited = action.split(/[,\s]/)
      method = splited[0].downcase
      return send(method) if splited[1].nil?

      direction = splited[3]
      position = [splited[1].to_i, splited[2].to_i]
      send(method, direction, position)
    end

    def place(direction, position)
      return if invalid_position?(position)
      @toy = Toy.new(direction, position)
    end

    def move
      return unless @toy

      x = @toy.position[0] + @toy.direction.x
      y = @toy.position[1] + @toy.direction.y
      return if invalid_position?(x: x, y: y)

      @toy.move
    end

    def invalid_position?(cords)
      (cords[0] > @dimentions[0] || cords[0] < 0) || (cords[1] > @dimentions[1] || cords[1] < 0)
    end

    def left
      return unless @toy
      @toy.rotate :LEFT
    end

    def right
      return unless @toy
      @toy.rotate :RIGHT
    end

    def report
      return unless @toy
      direction = @toy.direction_name
      puts "#{@toy.position[0]},#{@toy.position[1]},#{direction}"
    end
  end
end