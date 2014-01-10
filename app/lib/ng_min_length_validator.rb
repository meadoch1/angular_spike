class NgMinLengthValidator < NgValidator
  def initialize(am_validator)
    raise StandardError.new 'am_validator must be an ActiveModel::Validations::LengthValidator' unless am_validator.is_a? ActiveModel::Validations::LengthValidator
    raise StandardError.new 'am_validator must have a minimum length option' unless am_validator.options[:minimum]
    super

    @minimum = am_validator.options[:minimum]
  end

  def input_attribute
    "ng-minlength"
  end

  def input_value
    @minimum
  end

  def ng_show_attribute
    "minlength"
  end

end
