require './robot.rb'
require './table.rb'
require './calculate_robot_position.rb'
require './place_robot.rb'
require 'test/unit'

class TestCalculateRobotPosition < Test::Unit::TestCase
  def test_calculate_robot_position_placed
    robot = Robot.new()
    table = Table.new()
    PlaceRobot.new(robot, table).action(1, 2, 'WEST')

    assert_equal('1,2,WEST', CalculateRobotPosition.new(robot).action())
  end

  def test_calculate_robot_position_not_placed
    robot = Robot.new()

    assert_equal('Robot has not been placed on table.', CalculateRobotPosition.new(robot).action())
  end
end
