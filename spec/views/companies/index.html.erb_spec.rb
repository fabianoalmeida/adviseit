require 'spec_helper'

describe "companies/index.html.erb" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :value => "Value"
      ),
      stub_model(Company,
        :value => "Value"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
