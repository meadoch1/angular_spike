require 'spec_helper'

describe RailsToNgValidationTranslator do
  describe '.translate' do
    it 'should identify only validations with ng: true' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:name, :nickname]).keys).to be == [:name]
    end

    it 'should return NgValidation classes' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:name, :nickname])[:name].first).to be_a NgValidator
    end
    
    it 'should return a NgRequiredValidator for a PresenceValidator' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:name])[:name].first).to be_a NgRequiredValidator
    end

    it 'should return a NgPatternValidator for a FormatValidator' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:password])[:password].first).to be_a NgPatternValidator
    end
    it 'should return a NgMinLengthValidator for a LengthValidator' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:username])[:username].first).to be_a NgMinLengthValidator
    end
    it 'should return a NgMaxLengthValidator for a LengthValidator' do
      expect(RailsToNgValidationTranslator.translate(ClientValTestClass, [:username])[:username].last).to be_a NgMaxLengthValidator
    end
  end
end
