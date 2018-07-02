# Calculate the robots position (including facing) on the table

require './validate_robot_is_placed.rb'

class CalculateRobotPosition
  def initialize(robot)
    @robot = robot
  end

  def action()
    if ValidateRobotIsPlaced.new().validate(@robot)
      return "#{@robot.x_position},#{@robot.y_position},#{@robot.facing}"
    else
      return "Robot has not been placed on table."
    end
  end
end
