require 'spec_helper'

describe "departments/show.html.erb" do
  before(:each) do
    @department = assign(:department, stub_model(Department,
      :value => "Value",
      :company => stub_model(Company, :value => "Company")
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company/)
  end
end
