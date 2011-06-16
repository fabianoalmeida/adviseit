require 'spec_helper'

describe "forms/index.html.erb" do
  before(:each) do
    assign(:forms, [
      stub_model(Form,
        :value => "Value",
        :status => stub_model(Status, :value => "Status")
      ),
      stub_model(Form,
        :value => "Value",
        :status => stub_model(Status, :value => "Status")
      )
    ])
  end

  it "renders a list of forms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
