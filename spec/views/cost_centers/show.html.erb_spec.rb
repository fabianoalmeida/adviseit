require 'spec_helper'

describe "cost_centers/show.html.erb" do
  before(:each) do
    @cost_center = assign(:cost_center, stub_model(CostCenter,
      :value => "Value",
      :department => stub_model(Department, :value => "Department")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Department/)
  end
end
