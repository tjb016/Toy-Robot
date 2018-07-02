require './robot.rb'
require './table.rb'
require './place_robot.rb'
require 'test/unit'

class TestPlaceRobot < Test::Unit::TestCase
  def test_placement_valid
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1, 1, 'WEST')

    assert_equal(1, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('WEST', robot.facing)
  end

  def test_placement_x_position_invalid
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(6, 1, 'WEST')

    assert_equal(0, robot.x_position)
    assert_equal(0, robot.y_position)
    assert_equal(nil, robot.facing)
  end

  def test_placement_y_position_invalid
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1, 6, 'WEST')

    assert_equal(0, robot.x_position)
    assert_equal(0, robot.y_position)
    assert_equal(nil, robot.facing)
  end

  def test_placement_facing_invalid
    robot = Robot.new()
    table = Table.new()

    PlaceRobot.new(robot, table).action(1 , 1, 'SOMEWHERE')

    assert_equal(0, robot.x_position)
    assert_equal(0, robot.y_position)
    assert_equal(nil, robot.facing)
  end

  def test_replacement_valid
    robot = Robot.new()
    table = Table.new()

    placeRobot = PlaceRobot.new(robot, table)
    placeRobot.action(1, 1, 'WEST')
    placeRobot.action(2, 4, 'NORTH')

    assert_equal(2, robot.x_position)
    assert_equal(4, robot.y_position)
    assert_equal('NORTH', robot.facing)
  end

  def test_replacement_invalid
    robot = Robot.new()
    table = Table.new()

    placeRobot = PlaceRobot.new(robot, table)
    placeRobot.action(1, 1, 'WEST')
    placeRobot.action(2, 4, 'Not Here')

    assert_equal(1, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('WEST', robot.facing)
  end
end
