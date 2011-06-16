require 'spec_helper'

describe Question do

  describe "saving a register" do
    before :each do
      @question = Factory.build(:question)
    end

    it "should be save" do
      @question.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @question.save
      question_invalid = Factory.build(:question, :value => @question.value)
      question_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @question.save
      question_upcase = Factory.build(:question, :value => @question.value.upcase)
      question_upcase.should have(1).errors_on(:value)
      question_downcase = Factory.build(:question, :value => @question.value.downcase)
      question_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @question = Factory.build(:question)
    end

    it "should not be nil" do
      @question.value= nil
      @question.should_not be_valid
    end

    it "should not be empty" do
      @question.value= ''
      @question.should_not be_valid
    end

    it "should not pass cause the length is less than three" do
      @question.value= 'a'
      @question.should have(1).errors_on(:value)
      @question.value= 'ab'
      @question.should have(1).errors_on(:value)
    end

    it "should not pass cause the length is more than fifty" do
      @question.value= 'abcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywz'
      @question.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'status'" do
    before :each do
      @question = Factory.build(:question)
    end

    it "should not be nil" do
      @question.status= nil
      @question.should have(1).errors_on(:status)
    end

    it "should be included in Status.all" do
      Status.all.include?(@question.status).should be_true
    end
  end

  describe "getting attribute 'form'" do
    before :each do
      @question = Factory.build(:question)
    end

    it "should not be nil" do
      @question.form= nil
      @question.should have(1).errors_on(:form)
    end

    it "should be included in Form.all" do
      Form.all.include?(@question.form).should be_true
    end
  end
end
