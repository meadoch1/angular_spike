require 'spec_helper'

describe NgMaxLengthValidator do
  let(:val) { NgMaxLengthValidator.new ClientValTestClass._validators[:username].first }
  describe "#input_attribute" do
    it 'should return the ng-maxlength reference' do
      expect(val.input_attribute).to be == "ng-maxlength=\"10\""
    end
  end
  describe "#ng_show_attribute" do
    it 'should return maxlength' do
      expect(val.ng_show_attribute).to be == "maxlength"
    end
  end
end
