class NgPatternValidator < NgValidator
  def initialize(am_validator)
    raise StandardError.new 'am_validator must be an ActiveModel::Validations::FormatValidator' unless am_validator.is_a? ActiveModel::Validations::FormatValidator
    super

    @pattern = am_validator.options[:with]
  end

  def input_attribute
    "ng-pattern=\"/#{to_javascript_regex @pattern}/\""
  end

  def ng_show_attribute
    "pattern"
  end

  protected
  def to_javascript_regex(ruby_regex)
    ruby_regex.inspect.
        sub('\\A' , '^').
        sub('\\Z' , '$').
        sub('\\z' , '$').
        sub(/^\// , '').
        sub(/\/[a-z]*$/ , '').
        gsub(/\(\?#.+\)/ , '').
        gsub(/\(\?-\w+:/ , '(').
        gsub(/\s/ , '')
  end
  
end
