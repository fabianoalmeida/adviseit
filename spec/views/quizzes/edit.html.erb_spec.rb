require 'spec_helper'

describe "quizzes/edit.html.erb" do
  before(:each) do
    @quiz = assign(:quiz, stub_model(Quiz,
      :value => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit quiz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quizzes_path(@quiz), :method => "post" do
      assert_select "input#quiz_value", :name => "quiz[value]"
      assert_select "input#quiz_description", :name => "quiz[description]"
    end
  end
end
