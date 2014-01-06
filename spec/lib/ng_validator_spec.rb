require 'spec_helper'

describe NgValidator do
  describe '.initialize' do
    it 'should accept an ActiveModel::Validator' do
      expect(NgValidator.new ClientValTestClass._validators[:name].first).to be_a NgValidator
    end
    it 'should raise an exception if passed anything that is not an ActiveModel::Validator' do
      expect{NgValidator.new Object.new}.to raise_error(/must be an ActiveModel/)
    end
    it 'should raise an exception if passed a validator without a custom message' do
      expect{NgValidator.new ClientValTestClass._validators[:bad].first}.to raise_error(/must have a message/)
    end
  end

  let(:val) {NgValidator.new ClientValTestClass._validators[:name].first }
  [:input_attribute, :ng_show_attribute].each do |call|
    describe "##{call}" do
      it 'should raise a NotImplementedError' do
        expect{val.send(call)}.to raise_error NotImplementedError
      end
    end
  end

  describe '#message' do
    it 'should return the message from the ActiveModel validator' do
      expect(val.message).to be == "is required right now"
    end
  end
end
