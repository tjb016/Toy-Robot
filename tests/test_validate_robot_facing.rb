require './table.rb'
require './validate_robot_facing.rb'
require 'test/unit'

class TestValidateRobotFacing < Test::Unit::TestCase
  def test_validate_robot_facing_valid
    table = Table.new()
    validateRobotFacing = ValidateRobotFacing.new(table)

    assert_equal(true, validateRobotFacing.validate('NORTH'))
  end

  def test_validate_robot_facing_invalid
    table = Table.new()
    validateRobotFacing = ValidateRobotFacing.new(table)

    assert_equal(false, validateRobotFacing.validate('Not valid'))
  end
end
