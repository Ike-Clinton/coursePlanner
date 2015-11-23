require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :from_user => "From User",
        :body => "MyText",
        :student_id => 1
      ),
      Comment.create!(
        :from_user => "From User",
        :body => "MyText",
        :student_id => 1
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "From User".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
