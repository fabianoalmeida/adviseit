require 'spec_helper'

describe "cost_centers/edit.html.erb" do
  before(:each) do
    @cost_center = assign(:cost_center, stub_model(CostCenter,
      :value => "MyString",
      :department => stub_model(Department, :id => 1)
    ))
  end

  it "renders the edit cost_center form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cost_centers_path(@cost_center), :method => "post" do
      assert_select "input#cost_center_value", :name => "cost_center[value]"
      assert_select "select#cost_center_department_id", :name => "cost_center[department_id]"
    end
  end
end
