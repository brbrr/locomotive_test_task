# module ToyRobot
#   class Vector
#     attr_accessor :x, :y
#     def initialize(x, y)
#       @x = x
#       @y = y
#     end

#     def rotate(direction)
#       raise 'Invaid direction' unless ROTATION.keys.include? direction.to_sym
#       radians = ROTATION[direction.to_sym] * Math::PI / 2
#       rotate_rad(radians)
#     end

#     def rotate_rad(radians)
#       cos = Math.cos(radians)
#       sin = Math.sin(radians)
#       x = (@x * cos) - (@y * sin)
#       y = (@x * sin) + (@y * cos)
#       @x = x.round
#       @y = y.round
#     end

#     def to_h
#       { x: @x, y: @y }
#     end
#   end
# end