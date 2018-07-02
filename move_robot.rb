# Move the robot on space forward

require './validate_robot_is_placed.rb'

class MoveRobot
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def action()
    if ValidateRobotIsPlaced.new().validate(@robot)
      new_x_position = @robot.x_position
      new_y_position = @robot.y_position

      case @table.possible_facing.find_index(@robot.facing)
      when 0
        new_y_position += 1
      when 1
        new_x_position += 1
      when 2
        new_y_position -= 1
      when 3
        new_x_position -= 1
      end

      if ValidateRobotPlacement.new(@table).validate(new_x_position, new_y_position)
        SetRobotPlacement.new(@robot).action(new_x_position, new_y_position)
      end
    end
  end
end
