require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :from_user => "MyString",
      :body => "MyText",
      :student_id => 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_from_user[name=?]", "comment[from_user]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_student_id[name=?]", "comment[student_id]"
    end
  end
end
