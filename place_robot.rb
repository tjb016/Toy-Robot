# Place robot on the table

require './validate_robot_facing.rb'
require './validate_robot_placement.rb'
require './set_robot_facing.rb'
require './set_robot_placement.rb'

class PlaceRobot
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def action(x_position, y_position, facing)
    if ValidateRobotPlacement.new(@table).validate(x_position, y_position) && ValidateRobotFacing.new(@table).validate(facing)
      SetRobotPlacement.new(@robot).action(x_position, y_position)
      SetRobotFacing.new(@robot).action(facing)
    end
  end
end
