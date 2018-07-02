# Validate whether robot has been placed on the table

class ValidateRobotIsPlaced
  def initialize()
  end

  def validate(robot)
    return robot.facing != nil
  end
end
