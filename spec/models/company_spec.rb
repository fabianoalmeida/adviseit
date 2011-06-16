require 'spec_helper'

describe Company do

  describe "saving a register" do
    before :each do
      @company = Factory.build(:company)
    end

    it "should be save" do
      @company.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @company.save
      company_invalid = Factory.build(:company, :value => @company.value)
      company_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @company.save
      company_upcase = Factory.build(:company, :value => @company.value.upcase)
      company_upcase.should have(1).errors_on(:value)
      company_downcase = Factory.build(:company, :value => @company.value.downcase)
      company_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @company = Factory.build(:company)
    end

    it "should not be nil" do
      @company.value= nil
      @company.should_not be_valid
    end

    it "should not be empty" do
      @company.value= ''
      @company.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @company.value= 'a'
      @company.should have(1).errors_on(:value)
      @company.value= 'ab'
      @company.should have(1).errors_on(:value)
      @company.value= 'abc'
      @company.should have(1).errors_on(:value)
      @company.value= 'abcd'
      @company.should have(1).errors_on(:value)
    end

    it "should not pass cause the length is more than forty" do
      (1..41).each do |n|
        @company.value << n
      end
      @company.should have(1).errors_on(:value)
    end
  end

end
