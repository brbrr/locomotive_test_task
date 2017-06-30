module ToyRobot
  class ToyDriver
    attr_accessor :field_size, :toy
    def initialize
      @field_size = [5, 5]
    end

    # NOTE: Expected only valid actions
    def call(actions_arry)
      return send(actions_arry[0]) if actions_arry[1].nil?
      send(actions_arry[0], actions_arry[1], actions_arry[2])
    end

    def place(direction, position)
      return if invalid_position?(position)
      @toy = Toy.new(direction, position)
    end

    def move
      return unless @toy

      x = @toy.position[0] + @toy.direction[0]
      y = @toy.position[1] + @toy.direction[1]
      return if invalid_position?([x, y])

      @toy.move
    end

    def invalid_position?(cords)
      (cords[0] > @field_size[0] || cords[0] < 0) || (cords[1] > @field_size[1] || cords[1] < 0)
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