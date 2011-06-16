require 'spec_helper'

describe "forms/show.html.erb" do
  before(:each) do
    @form = assign(:form, mock_model(Form,
      :value => "Value",
      :multiple => true,
      :options => [stub_model(Option, :value => "Option"), 
                   stub_model(Option, :value => "Option")],
      :status => stub_model(Status, :id => 1, :value => "Status")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/true/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Option/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Option/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
