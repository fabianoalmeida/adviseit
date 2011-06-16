require 'spec_helper'

describe "cost_centers/index.html.erb" do
  before(:each) do
    assign(:cost_centers, [
      stub_model(CostCenter,
        :value => "Value",
        :department => stub_model(Department, :value => "Department")
      ),
      stub_model(CostCenter,
        :value => "Value",
        :department => stub_model(Department, :value => "Department")
      )
    ])
  end

  it "renders a list of cost_centers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Department".to_s, :count => 2
  end
end
