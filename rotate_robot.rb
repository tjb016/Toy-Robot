# Rotate robot on the table

require './validate_robot_is_placed.rb'
require './validate_robot_facing.rb'
require './set_robot_facing.rb'

class RotateRobot
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def action(direction)
    if ValidateRobotIsPlaced.new().validate(@robot)
      if direction == 'LEFT'
        list_of_facing = @table.possible_facing
      elsif direction == 'RIGHT'
        list_of_facing = @table.possible_facing.reverse
      else
        return nil
      end

      if list_of_facing.find_index(@robot.facing) == 0
        new_facing = list_of_facing[3]
      else
        new_facing = list_of_facing[list_of_facing.find_index(@robot.facing) - 1]
      end

      if ValidateRobotFacing.new(@table).validate(new_facing)
        SetRobotFacing.new(@robot).action(new_facing)
      end
    end
  end
end
