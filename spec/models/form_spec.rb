require 'spec_helper'

describe Form do

  describe "saving a register" do
    before :each do
      @form = Factory.build(:form)
    end

    it "should be save" do
      @form.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @form.save
      form_invalid = Factory.build(:form, :value => @form.value)
      form_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @form.save
      form_upcase = Factory.build(:form, :value => @form.value.upcase)
      form_upcase.should have(1).errors_on(:value)
      form_downcase = Factory.build(:form, :value => @form.value.downcase)
      form_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @form = Factory.build(:form)
    end

    it "should not be nil" do
      @form.value= nil
      @form.should_not be_valid
    end

    it "should not be empty" do
      @form.value= ''
      @form.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @form.value= 'a'
      @form.should have(1).errors_on(:value)
      @form.value= 'ab'
      @form.should have(1).errors_on(:value)
      @form.value= 'abc'
      @form.should have(1).errors_on(:value)
      @form.value= 'abcd'
      @form.should have(1).errors_on(:value)
    end
    
    it "should not pass cause the length is more than fifty" do
      @form.value= 'abcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywz'
      @form.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'status'" do
    before :each do
      @form = Factory.build(:form)
    end

    it "should not be nil" do
      @form.status= nil
      @form.should have(1).errors_on(:status)
    end

    it "should be included in Status.all" do
      Status.all.include?(@form.status).should be_true
    end
  end

  describe "getting attribute 'options'" do
    before :each do
      @form = Factory.build(:form)
    end

    it "should not be empty" do
      @form.options= []
      @form.should have(1).errors_on(:options)
    end

    it "should be included in Option.all" do
      Option.all.include?(@form.options.first).should be_true
    end
  end
end
