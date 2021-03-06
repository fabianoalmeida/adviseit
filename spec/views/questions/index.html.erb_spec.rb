require 'spec_helper'

describe "questions/index.html.erb" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :value => "Value",
        :form => stub_model(Form, :value => "Form"),
        :status => stub_model(Status, :value => "Status")
      ),
      stub_model(Question,
        :value => "Value",
        :form => stub_model(Form, :value => "Form"),
        :status => stub_model(Status, :value => "Status")
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Form".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
