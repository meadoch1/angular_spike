class NgValidator
  def initialize(am_validator)
    raise StandardError.new 'am_validator must be an ActiveModel::Validator' unless am_validator.is_a? ActiveModel::Validator
    raise StandardError.new 'am_validator must have a message option' unless am_validator.options[:message]
    @message = am_validator.options[:message]
  end

  def input_attribute
    raise NotImplementedError.new 'This method needs to be overridden in a child class'
  end

  def ng_show_attribute
    raise NotImplementedError.new 'This method needs to be overridden in a child class'
  end
  
  def message
    @message
  end
end
