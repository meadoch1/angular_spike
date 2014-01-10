class NgRequiredValidator < NgValidator
  def initialize(am_validator)
    raise StandardError.new 'am_validator must be an ActiveModel::Validations::PresenceValidator' unless am_validator.is_a? ActiveModel::Validations::PresenceValidator
    super
  end

  def input_attribute
    "required"
  end

  def input_value
    nil
  end

  def ng_show_attribute
    "required"
  end
  
end
