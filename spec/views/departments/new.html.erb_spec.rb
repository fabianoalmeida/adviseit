require 'spec_helper'

describe "departments/new.html.erb" do
  before(:each) do
    assign(:department, stub_model(Department,
      :value => "MyString",
      :company => stub_model(Company, :id => 1)
    ).as_new_record)
  end

  it "renders new department form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => departments_path, :method => "post" do
      assert_select "input#department_value", :name => "department[value]"
      assert_select "select#department_company_id", :name => "department[company_id]"
    end
  end
end
