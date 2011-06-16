require 'spec_helper'

describe "departments/index.html.erb" do
  before(:each) do
    assign(:departments, [
      stub_model(Department,
        :value => "Value",
        :company => stub_model(Company, :value => "Company")
      ),
      stub_model(Department,
        :value => "Value",
        :company => stub_model(Company, :value => "Company")
      )
    ])
  end

  it "renders a list of departments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
