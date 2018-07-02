require './robot.rb'
require './table.rb'
require './rotate_robot.rb'
require 'test/unit'

class TestRotateRobot < Test::Unit::TestCase
  def test_rotate_robot_left
    robot = Robot.new()
    table = Table.new()
    rotateRobot = RotateRobot.new(robot, table)

    rotateRobot.action('LEFT')
    facing_not_set = robot.facing
    PlaceRobot.new(robot, table).action(1, 1, 'NORTH')
    facing_north = robot.facing
    rotateRobot.action('LEFT')
    facing_west = robot.facing
    rotateRobot.action('LEFT')
    facing_south = robot.facing
    rotateRobot.action('LEFT')
    facing_east = robot.facing

    assert_equal(facing_not_set, nil)
    assert_equal(facing_north, 'NORTH')
    assert_equal(facing_west, 'WEST')
    assert_equal(facing_south, 'SOUTH')
    assert_equal(facing_east, 'EAST')
  end

  def test_rotate_robot_right
    robot = Robot.new()
    table = Table.new()
    rotateRobot = RotateRobot.new(robot, table)

    rotateRobot.action('RIGHT')
    facing_not_set = robot.facing
    PlaceRobot.new(robot, table).action(1, 1, 'NORTH')
    facing_north = robot.facing
    rotateRobot.action('RIGHT')
    facing_east = robot.facing
    rotateRobot.action('RIGHT')
    facing_south = robot.facing
    rotateRobot.action('RIGHT')
    facing_west = robot.facing

    assert_equal(facing_not_set, nil)
    assert_equal(facing_north, 'NORTH')
    assert_equal(facing_west, 'WEST')
    assert_equal(facing_south, 'SOUTH')
    assert_equal(facing_east, 'EAST')
  end

  def test_rotate_robot_left_right
    robot = Robot.new()
    table = Table.new()
    rotateRobot = RotateRobot.new(robot, table)

    rotateRobot.action('RIGHT')
    facing_not_set = robot.facing
    PlaceRobot.new(robot, table).action(1, 1, 'NORTH')
    rotateRobot.action('RIGHT')
    facing_east = robot.facing
    rotateRobot.action('LEFT')
    facing_north = robot.facing

    assert_equal(facing_not_set, nil)
    assert_equal(facing_north, 'NORTH')
    assert_equal(facing_east, 'EAST')
  end

  def test_rotate_robot_invalid
    robot = Robot.new()
    table = Table.new()
    rotateRobot = RotateRobot.new(robot, table)

    PlaceRobot.new(robot, table).action(1, 1, 'NORTH')
    rotateRobot.action('FOO')
    rotateRobot.action('ROO')

    assert_equal(robot.facing, 'NORTH')
  end
end
