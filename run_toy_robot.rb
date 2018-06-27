require './robot.rb'

robot = Robot.new()

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
    robot.move()
  elsif user_input == 'LEFT'
    robot.left()
  elsif user_input == 'RIGHT'
    robot.right()
  elsif user_input == 'REPORT'
    puts robot.report()
  elsif user_input.match(/^PLACE (\d*),(\d*),(\w*)$/)
    parameters = user_input.match(/^PLACE (\d*),(\d*),(\w*)$/)
    if robot.place(parameters[1].to_i, parameters[2].to_i, parameters[3]) != true
      puts "Unable to place robot at #{parameters[1]},#{parameters[2]},#{parameters[3]}."
    end
  end
end
