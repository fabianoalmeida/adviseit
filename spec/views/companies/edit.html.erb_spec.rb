require 'spec_helper'

describe "companies/edit.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :value => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_value", :name => "company[value]"
    end
  end
end
