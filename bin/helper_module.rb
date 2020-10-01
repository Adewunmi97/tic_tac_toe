module HelperMethods
  def valid_input?(choice)
    return false if !choice.is_a?(Integer) || !choice.between?(1, 9)
    true
  end
end