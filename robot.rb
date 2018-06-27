# Toy Robot which can be placed upon a table and moved.
class Robot
  def initialize()
    # Note that the ordering of @possible_facing is important for working with direction.
    # This array should consist of four values representing 'NORTH', 'EAST', 'SOUTH', 'WEST'
    @possible_facing = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    @min_x_position = 0
    @max_x_position = 5
    @min_y_position = 0
    @max_y_position = 5
    @movement_speed = 1
  end

# Place robot on the grid.
# If the coordinates are valid true will be returned, otherwise false.
  def place(x_position, y_position, facing)
    if x_position < @min_x_position || x_position > @max_x_position ||
      y_position < @min_y_position || y_position > @max_y_position ||
      @possible_facing.include?(facing) == false
      return false
    end

    @x_position = x_position
    @y_position = y_position
    @facing = facing
    @robot_on_table = true
    return true
  end

# Move the robot forward. Robot will not move if not on the table or
# moving would result in the robot leaving the table.
  def move()
    if @robot_on_table == true
      if @facing == @possible_facing[0] && @max_y_position >= @y_position + @movement_speed
        @y_position += @movement_speed
      elsif @facing == @possible_facing[2] && @min_y_position <= @y_position - @movement_speed
        @y_position -= @movement_speed
      elsif @facing == @possible_facing[1] && @max_x_position >= @x_position + @movement_speed
        @x_position += @movement_speed
      elsif @facing == @possible_facing[3] && @min_x_position <= @x_position - @movement_speed
        @x_position -= @movement_speed
      end
    end
  end

# Turn the robot left. Robot will not turn if not on the table.
  def left()
    if @robot_on_table == true
      if @possible_facing.find_index(@facing) == 0
        @facing = @possible_facing[3]
      else
        @facing = @possible_facing[@possible_facing.find_index(@facing) - 1]
      end
    end
  end

  # Turn the robot right. Robot will not turn if not on the table.
  def right()
    if @robot_on_table == true
      if @possible_facing.find_index(@facing) == 3
        @facing = @possible_facing[0]
      else
        @facing = @possible_facing[@possible_facing.find_index(@facing) + 1]
      end
    end
  end

  # Report the robots position.
  def report()
    if @robot_on_table == true
      return "#{@x_position},#{@y_position},#{@facing}"
    else
      return "Robot has not been placed on table."
    end
  end
end
