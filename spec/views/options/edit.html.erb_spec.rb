require 'spec_helper'

describe "options/edit.html.erb" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :value => "MyString",
      :has_text_field => false,
      :status => stub_model(Status, :id => 1, :value => "Status")
    ))
  end

  it "renders the edit option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => options_path(@option), :method => "post" do
      assert_select "input#option_value", :name => "option[value]"
      assert_select "input#option_has_text_field", :name => "option[has_text_field]"
      assert_select "input#option_status_id_1", :name => "option[status_id]"
    end
  end
end
