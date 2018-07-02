# Validate robot facing to see if it's usable on the table

class ValidateRobotFacing
  def initialize(table)
    @table = table
  end

  def validate(facing)
    return @table.possible_facing.include?(facing)
  end
end
