# Table which the robot can be placed on
class Table
  attr_reader :min_x_position
  attr_reader :max_x_position
  attr_reader :min_y_position
  attr_reader :max_y_position
  attr_reader :possible_facing

  def initialize()
    @min_x_position = 0
    @max_x_position = 5
    @min_y_position = 0
    @max_y_position = 5
    # Note that the ordering of @possible_facing is important for working with direction.
    # This array should consist of four values representing 'NORTH', 'EAST', 'SOUTH', 'WEST'
    @possible_facing = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  end
end
