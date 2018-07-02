require './robot.rb'
require './table.rb'
require './place_robot.rb'
require './validate_robot_is_placed.rb'
require 'test/unit'

class TestValidateRobotIsPlaced < Test::Unit::TestCase
  def test_robot_is_placed
    robot = Robot.new()
    table = Table.new()

    robot_not_placed = ValidateRobotIsPlaced.new().validate(robot)
    PlaceRobot.new(robot, table).action(1,1,'NORTH')
    robot_placed = ValidateRobotIsPlaced.new().validate(robot)

    assert_equal(false, robot_not_placed)
    assert_equal(true, robot_placed)
  end
end
