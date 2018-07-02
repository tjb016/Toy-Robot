# Validates that robot placement is within the allowable parameters
class ValidateRobotPlacement
  def initialize(table)
    @table = table
  end

  def validate(x,y)
    if x < @table.min_x_position || x > @table.max_x_position ||
      y < @table.min_y_position || y > @table.max_y_position
      return false
    else
      return true
    end
  end
end
