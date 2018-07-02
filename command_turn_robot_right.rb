# Command to turn the robot right

require './rotate_robot.rb'

class CommandTurnRobotRight
  def initialize()
  end

  def execute(robot, table)
    RotateRobot.new(robot, table).action('RIGHT')
  end
end
