require 'spec_helper'

describe HomeController do

  def mock_quiz(stubs={})
    @mock_quiz ||= mock_model(Quiz, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all quizzes as @quizzes" do
      Quiz.stub(:actives) { [mock_quiz] }
      get :index
      assigns(:quizzes).should eq([mock_quiz])
    end
  end

end
