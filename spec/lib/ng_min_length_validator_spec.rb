require 'spec_helper'

describe NgMinLengthValidator do
  let(:val) { NgMinLengthValidator.new ClientValTestClass._validators[:username].first }
  describe "#input_attribute" do
    it 'should return the ng-minlength reference' do
      expect(val.input_attribute).to be == "ng-minlength=\"2\""
    end
  end
  describe "#ng_show_attribute" do
    it 'should return minlength' do
      expect(val.ng_show_attribute).to be == "minlength"
    end
  end
end
