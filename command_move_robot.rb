# Command to move robot one space on the table

require './move_robot.rb'

class CommandMoveRobot
  def initialize()
  end

  def execute(robot, table)
    MoveRobot.new(robot, table).action()
  end
end
