require 'spec_helper'

describe "quizzes/index.html.erb" do
  before(:each) do
    assign(:quizzes, [
      stub_model(Quiz,
        :value => "Value",
        :description => "Description",
        :status => stub_model(Status, :value => "Status")
      ),
      stub_model(Quiz,
        :value => "Value",
        :description => "Description",
        :status => stub_model(Status, :value => "Status")
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
