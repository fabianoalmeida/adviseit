require 'spec_helper'

describe "answers/index.html.erb" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :quiz => stub_model(Quiz, :value => "Quiz")
      ),
      stub_model(Answer,
        :quiz => stub_model(Quiz, :value => "Quiz")
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Quiz".to_s, :count => 2
  end
end
