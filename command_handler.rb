# Handles the execution of commands for a robot and table combination

class CommandHandler
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def execute(command)
    command.execute(@robot, @table)
  end
end
