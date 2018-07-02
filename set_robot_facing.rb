# Set the robots facing (e.g. NORTH, EAST, SOUTH, WEST)

class SetRobotFacing
  def initialize(robot)
    @robot = robot
  end

  def action(facing)
    @robot.facing = facing
  end
end
