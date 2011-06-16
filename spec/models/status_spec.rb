require 'spec_helper'

describe Status do

  describe "saving a register" do
    before :each do
      @status = Factory.build(:status)
    end

    it "should be save" do
      @status.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @status.save
      status_invalid = Factory.build(:status, :value => @status.value)
      status_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @status.save
      status_upcase = Factory.build(:status, :value => @status.value.upcase)
      status_upcase.should have(1).errors_on(:value)
      status_downcase = Factory.build(:status, :value => @status.value.downcase)
      status_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @status = Factory.build(:status)
    end

    it "should not be nil" do
      @status.value= nil
      @status.should_not be_valid
    end

    it "should not be empty" do
      @status.value= ''
      @status.should_not be_valid
    end

    it "should not pass cause the length is less than three" do
      @status.value= 'a'
      @status.should have(1).errors_on(:value)
      @status.value= 'ab'
      @status.should have(1).errors_on(:value)
    end

    it "should pass cause the length is between three and fifteen" do
      @status.value= 'abc'
      @status.should have(:no).errors_on(:value)
      @status.value= 'abcdefghijklmno'
      @status.should have(:no).errors_on(:value)
    end

    it "should not pass cause the length is more than fifteen" do
      @status.value= 'abcdefghijklmnop'
      @status.should have(1).errors_on(:value)
    end
  end

end

