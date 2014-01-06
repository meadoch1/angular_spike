require 'spec_helper'

describe NgRequiredValidator do
  let(:val) { NgRequiredValidator.new ClientValTestClass._validators[:name].first }
  [:input_attribute, :ng_show_attribute].each do |call|
    describe "##{call}" do
      it 'should return the correct value' do
        expect(val.send(call)).to be == "required"
      end
    end
  end
end
