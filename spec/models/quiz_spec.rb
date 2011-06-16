require 'spec_helper'

describe Quiz do

  describe "saving a register" do
    before :each do
      @quiz = Factory.build(:quiz)
    end

    it "should be save" do
      @quiz.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @quiz.save
      quiz_invalid = Factory.build(:quiz, :value => @quiz.value)
      quiz_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @quiz.save
      quiz_upcase = Factory.build(:quiz, :value => @quiz.value.upcase)
      quiz_upcase.should have(1).errors_on(:value)
      quiz_downcase = Factory.build(:quiz, :value => @quiz.value.downcase)
      quiz_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @quiz = Factory.build(:quiz)
    end

    it "should not be nil" do
      @quiz.value= nil
      @quiz.should_not be_valid
    end

    it "should not be empty" do
      @quiz.value= ''
      @quiz.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @quiz.value= 'a'
      @quiz.should have(1).errors_on(:value)
      @quiz.value= 'ab'
      @quiz.should have(1).errors_on(:value)
      @quiz.value= 'abc'
      @quiz.should have(1).errors_on(:value)
      @quiz.value= 'abcd'
      @quiz.should have(1).errors_on(:value)
    end
    
    it "should not pass cause the length is more than twenty" do
      @quiz.value= 'abcdefghijklmnopqrstuvxywz'
      @quiz.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'description'" do
    before :each do
      @quiz = Factory.build(:quiz)
    end

    it "should not be nil" do
      @quiz.description= nil
      @quiz.should be_valid
    end

    it "should not be empty" do
      @quiz.description= ''
      @quiz.should be_valid
    end

    it "should not pass cause the length is less than five" do
      @quiz.description= 'a'
      @quiz.should have(1).errors_on(:description)
      @quiz.description= 'ab'
      @quiz.should have(1).errors_on(:description)
      @quiz.description= 'abc'
      @quiz.should have(1).errors_on(:description)
      @quiz.description= 'abcd'
      @quiz.should have(1).errors_on(:description)
    end
    
    it "should not pass cause the length is more than hundred" do
      @quiz.description= 'abcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywz'
      @quiz.should have(1).errors_on(:description)
    end
  end
  
  describe "getting attribute 'status'" do
    before :each do
      @quiz = Factory.build(:quiz)
    end

    it "should not be nil" do
      @quiz.status= nil
      @quiz.should have(1).errors_on(:status)
    end

    it "should be included in Status.all" do
      Status.all.include?(@quiz.status).should be_true
    end
  end

  describe "getting attribute 'subjects'" do
    before :each do
      @quiz = Factory.build(:quiz)
    end

    it "should not be empty" do
      @quiz.subjects= []
      @quiz.should have(1).errors_on(:subjects)
    end

    it "should be included in Subject.all" do
      Subject.all.include?(@quiz.subjects.first).should be_true
    end
  end
end
