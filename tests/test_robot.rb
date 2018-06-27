require './robot.rb'
require 'test/unit'

class TestRobot < Test::Unit::TestCase
  def test_place_x_too_small
    robot = Robot.new()

    assert(robot.place(-1,1,'NORTH') == false, 'Expected place to return false due to x being too small.')
  end

  def test_place_x_too_large
    robot = Robot.new()

    assert(robot.place(6,1,'NORTH') == false, 'Expected place to return false due to x being too large.')
  end

  def test_place_x_valid
    robot = Robot.new()

    assert(robot.place(1,1,'NORTH'), 'Expected place to return true.')
  end

  def test_place_y_too_small
    robot = Robot.new()

    assert(robot.place(1,-1,'NORTH') == false, 'Expected place to return false due to y being too small.')
  end

  def test_place_y_too_large
    robot = Robot.new()

    assert(robot.place(1,6,'NORTH') == false, 'Expected place to return false due to y being too large.')
  end

  def test_place_y_valid
    robot = Robot.new()

    assert(robot.place(1,1,'NORTH'), 'Expected place to return true.')
  end

  def test_place_facing_invalid
    robot = Robot.new()

    assert(robot.place(1,1,'north') == false, "Expected place to return false due to facing being 'north'")
  end

  def test_place_facing_north
    robot = Robot.new()

    assert(robot.place(1,1,'NORTH'), 'Expected place to return true.')
  end

  def test_place_facing_south
    robot = Robot.new()

    assert(robot.place(1,1,'SOUTH'), 'Expected place to return true.')
  end

  def test_place_face_east
    robot = Robot.new()

    assert(robot.place(1,1,'EAST'), 'Expected place to return true.')
  end

  def test_place_face_west
    robot = Robot.new()

    assert(robot.place(1,1,'WEST'), 'Expected place to return true.')
  end

  def test_place_face_another_language
    robot = Robot.new()
    robot.instance_variable_set(:@possible_facing, ['NOORD', 'OOST', 'ZUID', 'WEST'])

    assert(robot.place(1,1,'NOORD'), 'Expected place to return true.')
  end

  def test_left()
    robot = Robot.new()
    robot.place(0,0,'NORTH')
    robot.left()
    robot_west = robot.report()
    robot.left()
    robot_south = robot.report()
    robot.left()
    robot_east = robot.report()
    robot.left()
    robot_north = robot.report()

    assert_equal('0,0,WEST', robot_west)
    assert_equal('0,0,SOUTH', robot_south)
    assert_equal('0,0,EAST', robot_east)
    assert_equal('0,0,NORTH', robot_north)
  end

  def test_right()
    robot = Robot.new()
    robot.place(0,0,'NORTH')
    robot.right()
    robot_east = robot.report()
    robot.right()
    robot_south = robot.report()
    robot.right()
    robot_west = robot.report()
    robot.right()
    robot_north = robot.report()

    assert_equal('0,0,EAST', robot_east)
    assert_equal('0,0,SOUTH', robot_south)
    assert_equal('0,0,WEST', robot_west)
    assert_equal('0,0,NORTH', robot_north)
  end

  def test_move_max_north
    robot = Robot.new()
    robot.place(0,5,'NORTH')
    robot.move()

    assert_equal('0,5,NORTH', robot.report())
  end

  def test_move_max_south
    robot = Robot.new()
    robot.place(0,0,'SOUTH')
    robot.move()

    assert_equal('0,0,SOUTH', robot.report())
  end

  def test_move_max_east
    robot = Robot.new()
    robot.place(5,0,'EAST')
    robot.move()

    assert_equal('5,0,EAST', robot.report())
  end

  def test_move_max_west
    robot = Robot.new()
    robot.place(0,0,'WEST')
    robot.move()

    assert_equal('0,0,WEST', robot.report())
  end

  def test_example_a
    robot = Robot.new()
    robot.place(0,0,'NORTH')
    robot.move()

    assert_equal('0,1,NORTH', robot.report())
  end

  def test_example_b
    robot = Robot.new()
    robot.place(0,0,'NORTH')
    robot.left()

    assert_equal('0,0,WEST', robot.report())
  end

  def test_example_c
    robot = Robot.new()
    robot.place(1,2,'EAST')
    robot.move()
    robot.move()
    robot.left()
    robot.move()

    assert_equal('3,3,NORTH', robot.report())
  end

  def test_example_c_with_replacement
    robot = Robot.new()
    robot.place(0,0,'WEST')
    robot.move()
    robot.place(1,2,'EAST')
    robot.move()
    robot.move()
    robot.left()
    robot.move()

    assert_equal('3,3,NORTH', robot.report())
  end
end
