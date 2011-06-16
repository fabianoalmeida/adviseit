require 'spec_helper'

describe Department do

  describe "saving a register" do
    before :each do
      @department = Factory.build(:department)
    end

    it "should be save" do
      @department.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @department.save
      department_invalid = Factory.build(:department, :value => @department.value)
      department_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @department.save
      department_upcase = Factory.build(:department, :value => @department.value.upcase)
      department_upcase.should have(1).errors_on(:value)
      department_downcase = Factory.build(:department, :value => @department.value.downcase)
      department_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @department = Factory.build(:department)
    end

    it "should not be nil" do
      @department.value= nil
      @department.should_not be_valid
    end

    it "should not be empty" do
      @department.value= ''
      @department.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @department.value= 'a'
      @department.should have(1).errors_on(:value)
      @department.value= 'ab'
      @department.should have(1).errors_on(:value)
      @department.value= 'abc'
      @department.should have(1).errors_on(:value)
      @department.value= 'abcd'
      @department.should have(1).errors_on(:value)
    end

    it "should not pass cause the length is more than forty" do
      (1..41).each do |n|
        @department.value << n
      end
      @department.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'company'" do
    before :each do
      @department = Factory.build(:department)
    end

    it "should not be nil" do
      @department.company= nil
      @department.should have(1).errors_on(:company)
    end
  end

end
