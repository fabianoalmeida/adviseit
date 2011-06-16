require 'spec_helper'

describe "cost_centers/new.html.erb" do
  before(:each) do
    assign(:cost_center, stub_model(CostCenter,
      :value => "MyString",
      :department => stub_model(Department, :id => 1)
    ).as_new_record)
  end

  it "renders new cost_center form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cost_centers_path, :method => "post" do
      assert_select "input#cost_center_value", :name => "cost_center[value]"
      assert_select "select#cost_center_department_id", :name => "cost_center[department_id]"
    end
  end
end
