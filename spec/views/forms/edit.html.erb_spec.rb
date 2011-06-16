require 'spec_helper'

describe "forms/edit.html.erb" do
  before(:each) do
    @form = assign(:form, stub_model(Form,
      :value => "MyString",
      :status => stub_model(Status, :id => 1, :value => "Status")
    ))
  end

  it "renders the edit form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => forms_path(@form), :method => "post" do
      assert_select "input#form_value", :name => "form[value]"
      assert_select "input#form_status_id_1", :name => "form[status_id]"
    end
  end
end
