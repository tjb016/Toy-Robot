require './robot.rb'
require './table.rb'
require './command_handler.rb'
require './command_move_robot.rb'
require './command_place_robot.rb'
require './command_report_robot_position.rb'
require './command_turn_robot_left.rb'
require './command_turn_robot_right.rb'
require 'test/unit'

class TestCommandHandler < Test::Unit::TestCase
  def test_command_handler_all_commands
    robot = Robot.new()
    table = Table.new()
    commandHandler = CommandHandler.new(robot, table)

    commandHandler.execute(CommandReportRobotPosition.new())

    commandHandler.execute(CommandPlaceRobot.new(1, 1, 'NORTH'))
    assert_equal(1, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('NORTH', robot.facing)
    commandHandler.execute(CommandReportRobotPosition.new())

    commandHandler.execute(CommandMoveRobot.new())
    assert_equal(1, robot.x_position)
    assert_equal(2, robot.y_position)
    assert_equal('NORTH', robot.facing)

    commandHandler.execute(CommandTurnRobotLeft.new())
    assert_equal(1, robot.x_position)
    assert_equal(2, robot.y_position)
    assert_equal('WEST', robot.facing)

    commandHandler.execute(CommandPlaceRobot.new(1, 1, 'NORTH'))
    assert_equal(1, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('NORTH', robot.facing)

    commandHandler.execute(CommandTurnRobotRight.new())
    assert_equal(1, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('EAST', robot.facing)
  end

  def test_example_a
    robot = Robot.new()
    table = Table.new()
    commandHandler = CommandHandler.new(robot, table)
    commandHandler.execute(CommandPlaceRobot.new(0, 0, 'NORTH'))
    commandHandler.execute(CommandMoveRobot.new())

    assert_equal(0, robot.x_position)
    assert_equal(1, robot.y_position)
    assert_equal('NORTH', robot.facing)
  end

  def test_example_b
    robot = Robot.new()
    table = Table.new()
    commandHandler = CommandHandler.new(robot, table)
    commandHandler.execute(CommandPlaceRobot.new(0, 0, 'NORTH'))
    commandHandler.execute(CommandTurnRobotLeft.new())

    assert_equal(0, robot.x_position)
    assert_equal(0, robot.y_position)
    assert_equal('WEST', robot.facing)
  end

  def test_example_c
    robot = Robot.new()
    table = Table.new()
    commandHandler = CommandHandler.new(robot, table)
    commandHandler.execute(CommandPlaceRobot.new(1, 2, 'EAST'))
    commandHandler.execute(CommandMoveRobot.new())
    commandHandler.execute(CommandMoveRobot.new())
    commandHandler.execute(CommandTurnRobotLeft.new())
    commandHandler.execute(CommandMoveRobot.new())

    assert_equal(3, robot.x_position)
    assert_equal(3, robot.y_position)
    assert_equal('NORTH', robot.facing)
  end

  def test_example_c_with_replacement
    robot = Robot.new()
    table = Table.new()
    commandHandler = CommandHandler.new(robot, table)
    commandHandler.execute(CommandPlaceRobot.new(0, 0, 'WEST'))
    commandHandler.execute(CommandMoveRobot.new())
    commandHandler.execute(CommandPlaceRobot.new(1, 2, 'EAST'))
    commandHandler.execute(CommandMoveRobot.new())
    commandHandler.execute(CommandMoveRobot.new())
    commandHandler.execute(CommandTurnRobotLeft.new())
    commandHandler.execute(CommandMoveRobot.new())

    assert_equal(3, robot.x_position)
    assert_equal(3, robot.y_position)
    assert_equal('NORTH', robot.facing)
  end
end
