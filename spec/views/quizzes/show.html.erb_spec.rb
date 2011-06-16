require 'spec_helper'

describe "quizzes/show.html.erb" do
  before(:each) do
    @quiz = assign(:quiz, mock_model(Quiz,
      :value => "Value",
      :description => "Description",
      :subjects => [stub_model(Subject, :value => "Sub01"),
                    stub_model(Subject, :value => "Sub01")],
      :status => stub_model(Status, :value => "Status")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sub01/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sub01/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
