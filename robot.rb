# Toy Robot which can be placed upon a table and moved.
class Robot
  attr_accessor :x_position
  attr_accessor :y_position
  attr_accessor :facing

  def initialize()
    @x_position = 0
    @y_position = 0
    @facing = nil
  end
end
