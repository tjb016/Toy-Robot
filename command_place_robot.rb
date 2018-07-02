# Command to place robot on the table

require './place_robot.rb'

class CommandPlaceRobot
  def initialize(x_position, y_position, facing)
    @x_position = x_position
    @y_position = y_position
    @facing = facing
  end

  def execute(robot, table)
    PlaceRobot.new(robot, table).action(@x_position, @y_position, @facing)
  end
end
