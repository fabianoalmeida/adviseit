require 'spec_helper'

describe "subjects/edit.html.erb" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :value => "MyString",
      :status => stub_model(Status, :id => 1, :value => "Status")
    ))
  end

  it "renders the edit subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path(@subject), :method => "post" do
      assert_select "input#subject_value", :name => "subject[value]"
      assert_select "input#subject_status_id_1", :name => "subject[status_id]"
    end
  end
end
