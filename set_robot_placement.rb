# Set robots grid placement on the table

class SetRobotPlacement
  def initialize(robot)
    @robot = robot
  end

  def action(x_position, y_position)
    @robot.x_position = x_position
    @robot.y_position = y_position
  end
end
