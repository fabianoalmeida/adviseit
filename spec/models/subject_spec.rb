require 'spec_helper'

describe Subject do

  describe "saving a register" do
    before :each do
      @subject = Factory.build(:subject)
    end

    it "should be save" do
      @subject.save.should be_true
    end

    it "should not be save with the same 'value'" do
      @subject.save
      subject_invalid = Factory.build(:subject, :value => @subject.value)
      subject_invalid.should have(1).errors_on(:value)
    end

    it "should not be save with the same 'value' in upper case or down case sensitive" do
      @subject.save
      subject_upcase = Factory.build(:subject, :value => @subject.value.upcase)
      subject_upcase.should have(1).errors_on(:value)
      subject_downcase = Factory.build(:subject, :value => @subject.value.downcase)
      subject_downcase.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'value'" do
    before :each do
      @subject = Factory.build(:subject)
    end

    it "should not be nil" do
      @subject.value= nil
      @subject.should_not be_valid
    end

    it "should not be empty" do
      @subject.value= ''
      @subject.should_not be_valid
    end

    it "should not pass cause the length is less than five" do
      @subject.value= 'a'
      @subject.should have(1).errors_on(:value)
      @subject.value= 'ab'
      @subject.should have(1).errors_on(:value)
      @subject.value= 'abc'
      @subject.should have(1).errors_on(:value)
      @subject.value= 'abcd'
      @subject.should have(1).errors_on(:value)
    end
    
    it "should not pass cause the length is more than fifty" do
      @subject.value= 'abcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywzabcdefghijklmnopqrstuvxywz'
      @subject.should have(1).errors_on(:value)
    end
  end

  describe "getting attribute 'status'" do
    before :each do
      @subject = Factory.build(:subject)
    end

    it "should not be nil" do
      @subject.status= nil
      @subject.should have(1).errors_on(:status)
    end

    it "should be included in Status.all" do
      Status.all.include?(@subject.status).should be_true
    end
  end

  describe "getting attribute 'questions'" do
    before :each do
      @subject = Factory.build(:subject)
    end

    it "should not be empty" do
      @subject.questions= []
      @subject.should have(1).errors_on(:questions)
    end

    it "should be included in Question.all" do
      Question.all.include?(@subject.questions.first).should be_true
    end
  end
end
