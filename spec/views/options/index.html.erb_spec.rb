require 'spec_helper'

describe "options/index.html.erb" do
  before(:each) do
    assign(:options, [
      stub_model(Option,
        :value => "Value",
        :has_text_field => false,
        :status => stub_model(Status, :value => "Status")
      ),
      stub_model(Option,
        :value => "Value",
        :has_text_field => false,
        :status => stub_model(Status, :value => "Status")
      )
    ])
  end

  it "renders a list of options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
