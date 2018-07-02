require './robot.rb'
require './table.rb'
require './move_robot.rb'
require './place_robot.rb'
require 'test/unit'

class TestMoveRobot < Test::Unit::TestCase
  def test_move_robot_north
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1, 1, 'NORTH')
    MoveRobot.new(robot, table).action()

    assert_equal(1, robot.x_position)
    assert_equal(2, robot.y_position)
    assert_equal('NORTH', robot.facing)
  end

  def test_move_robot_south
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1, 3, 'SOUTH')
    MoveRobot.new(robot, table).action()

    assert_equal(1, robot.x_position)
    assert_equal(2, robot.y_position)
    assert_equal('SOUTH', robot.facing)
  end

  def test_move_robot_east
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1, 1, 'EAST')
    MoveRobot.new(robot, table).action()

    assert_equal(2, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('EAST', robot.facing)
  end

  def test_move_robot_west
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(3, 1, 'WEST')
    MoveRobot.new(robot, table).action()

    assert_equal(2, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('WEST', robot.facing)
  end

  def test_move_robot_not_placed
    robot = Robot.new()
    table = Table.new()

    MoveRobot.new(robot, table).action()

    assert_equal(0, robot.x_position)
    assert_equal(0, robot.y_position)
    assert_equal(nil, robot.facing)
  end
end
