# Command to report robot position on the table

require './calculate_robot_position.rb'

class CommandReportRobotPosition
  def initialize()
  end

  def execute(robot, table)
    puts CalculateRobotPosition.new(robot).action()
  end
end
