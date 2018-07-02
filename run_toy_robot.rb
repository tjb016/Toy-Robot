# Runs the Toy Robot SImular via Command Line interface

require './robot.rb'
require './table.rb'
require './command_handler.rb'
require './command_handler.rb'
require './command_move_robot.rb'
require './command_place_robot.rb'
require './command_report_robot_position.rb'
require './command_turn_robot_left.rb'
require './command_turn_robot_right.rb'

commandHandler = CommandHandler.new(Robot.new(), Table.new())

puts "Welcome to the Toy Robot Simulator, which is controlled with the following commands:
      PLACE X,Y,F - X = x position, Y = y position, F = Facing ('NORTH', 'SOUTH', 'EAST', 'WEST')
      MOVE - Move the robot forward one step
      LEFT - Turn the robot left
      RIGHT - Turn the robot right
      REPORT - Report the robots position
      EXIT - Exit the simulator"

exit = false

while exit == false
  user_input = STDIN.gets.chomp

  if user_input == 'EXIT'
    exit = true
  elsif user_input == 'MOVE'
    commandHandler.execute(CommandMoveRobot.new())
  elsif user_input == 'LEFT'
    commandHandler.execute(CommandTurnRobotLeft.new())
  elsif user_input == 'RIGHT'
    commandHandler.execute(CommandTurnRobotRight.new())
  elsif user_input == 'REPORT'
    commandHandler.execute(CommandReportRobotPosition.new())
  elsif user_input.match(/^PLACE (\d*),(\d*),(\w*)$/)
    parameters = user_input.match(/^PLACE (\d*),(\d*),(\w*)$/)
    commandHandler.execute(CommandPlaceRobot.new(parameters[1].to_i, parameters[2].to_i, parameters[3]))
  end
end
