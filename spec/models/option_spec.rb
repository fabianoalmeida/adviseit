require 'spec_helper'

describe Option do

  describe "saving a register" do
    before :each do
      @option = Factory.build(:option)
    end

    it "should be save" do
      @option.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @option.save
      option_invalid = Factory.build(:option, :value => @option.value)
      option_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @option.save
      option_upcase = Factory.build(:option, :value => @option.value.upcase)
      option_upcase.should have(1).errors_on(:value)
      option_downcase = Factory.build(:option, :value => @option.value.downcase)
      option_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @option = Factory.build(:option)
    end

    it "should not be nil" do
      @option.value= nil
      @option.should_not be_valid
    end

    it "should not be empty" do
      @option.value= ''
      @option.should_not be_valid
    end

    it "should not pass cause the length is less than two" do
      @option.value= 'a'
      @option.should have(1).errors_on(:value)
    end

    it "should not pass cause the length is more than eighty" do
      @option.value= 'abcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywz'
      @option.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'status'" do
    before :each do
      @option = Factory.build(:option)
    end

    it "should not be nil" do
      @option.status= nil
      @option.should have(1).errors_on(:status)
    end
  end

end

