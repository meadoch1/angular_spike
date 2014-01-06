require 'spec_helper'

describe NgPatternValidator do
  let(:val) { NgPatternValidator.new ClientValTestClass._validators[:password].first }
  describe "#input_attribute" do
    it 'should return the ng-pattern reference' do
      expect(val.input_attribute).to be == "ng-pattern=\"/^[^\\s,]+$/\""
    end
  end
  describe "#ng_show_attribute" do
    it 'should return pattern' do
      expect(val.ng_show_attribute).to be == "pattern"
    end
  end
end
