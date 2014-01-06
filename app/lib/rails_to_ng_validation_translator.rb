class RailsToNgValidationTranslator

  def self.translate(klass, attributes)
    results = {}
    attributes.each do |attribute|
      klass._validators[attribute].each do |entry|
        if entry.options[:client]
          results[attribute] ||= []
          validator_factory(entry, results[attribute])
        end
      end if klass._validators.has_key?(attribute)
    end
    results
  end

  protected
  def self.validator_factory(am_validator, container)
    case am_validator
    when ActiveModel::Validations::PresenceValidator
      container << NgRequiredValidator.new(am_validator)
    when ActiveModel::Validations::FormatValidator
      container << NgPatternValidator.new(am_validator)
    when ActiveModel::Validations::LengthValidator
      container << NgMinLengthValidator.new(am_validator) if am_validator.options[:minimum]
      container << NgMaxLengthValidator.new(am_validator) if am_validator.options[:maximum]
    end
  end

end
