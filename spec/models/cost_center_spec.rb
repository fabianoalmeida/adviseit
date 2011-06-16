require 'spec_helper'

describe CostCenter do

  describe "saving a register" do
    before :each do
      @cost_center = Factory.build(:cost_center)
    end

    it "should be save" do
      @cost_center.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @cost_center.save
      cost_center_invalid = Factory.build(:cost_center, :value => @cost_center.value)
      cost_center_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @cost_center.save
      cost_center_upcase = Factory.build(:cost_center, :value => @cost_center.value.upcase)
      cost_center_upcase.should have(1).errors_on(:value)
      cost_center_downcase = Factory.build(:cost_center, :value => @cost_center.value.downcase)
      cost_center_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @cost_center = Factory.build(:cost_center)
    end

    it "should not be nil" do
      @cost_center.value= nil
      @cost_center.should_not be_valid
    end

    it "should not be empty" do
      @cost_center.value= ''
      @cost_center.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @cost_center.value= 'a'
      @cost_center.should have(1).errors_on(:value)
      @cost_center.value= 'ab'
      @cost_center.should have(1).errors_on(:value)
      @cost_center.value= 'abc'
      @cost_center.should have(1).errors_on(:value)
      @cost_center.value= 'abcd'
      @cost_center.should have(1).errors_on(:value)
    end

    it "should not pass cause the length is more than forty" do
      (1..41).each do |n|
        @cost_center.value << n
      end
      @cost_center.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'department'" do
    before :each do
      @cost_center = Factory.build(:cost_center)
    end

    it "should not be nil" do
      @cost_center.department= nil
      @cost_center.should have(1).errors_on(:department)
    end
  end

end
