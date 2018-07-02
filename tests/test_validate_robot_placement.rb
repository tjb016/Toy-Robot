require './table.rb'
require './validate_robot_placement.rb'
require 'test/unit'

class TestValidateRobotPlacement < Test::Unit::TestCase
  def test_placement_min_x_valid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(true, validateRobotPlacement.validate(1,1))
  end

  def test_placement_min_x_invalid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(false, validateRobotPlacement.validate(-1,1))
  end

  def test_placement_max_x_valid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(true, validateRobotPlacement.validate(5,1))
  end

  def test_placement_max_x_invalid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(false, validateRobotPlacement.validate(6,1))
  end

  def test_placement_min_y_valid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(true, validateRobotPlacement.validate(1,1))
  end

  def test_placement_min_y_invalid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(false, validateRobotPlacement.validate(1,-1))
  end

  def test_placement_max_y_valid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(true, validateRobotPlacement.validate(1,5))
  end

  def test_placement_max_y_invalid
    table = Table.new()
    validateRobotPlacement = ValidateRobotPlacement.new(table)

    assert_equal(false, validateRobotPlacement.validate(1,6))
  end
end
