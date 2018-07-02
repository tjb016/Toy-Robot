# Command to turn robot left

require './rotate_robot.rb'

class CommandTurnRobotLeft
  def initialize()
  end

  def execute(robot, table)
    RotateRobot.new(robot, table).action('LEFT')
  end
end
