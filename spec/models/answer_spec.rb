require 'spec_helper'

describe Answer do

  describe "saving a register" do
    before :each do
      @answer = Factory.build(:answer)
    end

    it "should be save" do
      @answer.save.should be_true
    end
  end
end
