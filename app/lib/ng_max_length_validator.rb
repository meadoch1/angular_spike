class NgMaxLengthValidator < NgValidator
  def initialize(am_validator)
    raise StandardError.new 'am_validator must be an ActiveModel::Validations::LengthValidator' unless am_validator.is_a? ActiveModel::Validations::LengthValidator
    raise StandardError.new 'am_validator must have a maximum length option' unless am_validator.options[:maximum]
    super

    @maximum = am_validator.options[:maximum]
  end

  def input_attribute
    "ng-maxlength=\"#{@maximum}\""
  end

  def ng_show_attribute
    "maxlength"
  end

end
