require 'spec_helper'

describe "options/show.html.erb" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :value => "Value",
      :has_text_field => false,
      :status => stub_model(Status, :value => "Status")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
