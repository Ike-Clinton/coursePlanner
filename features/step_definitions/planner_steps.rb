Given /the following user exists/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
     User.create!(user)
  end
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and academic class "([^\"]*)" and is advisor "([^\"]*)"$/ do |name,email, academic_class, is_advisor|
  @user = User.new(:email => email,
                   :name=>name,
                   :academic_class => academic_class,
                   :is_advisor => is_advisor)
   @user.save!
end

Given /^I am an authenticated user$/ do
  name = 'exmample'
  email = 'example@example.com'
  password = 'secret!'

  Given %{I have one user "#{name}" with email "#{email}" and password "#{password}"}
  And %{I go to the user login page}
  And %{I fill in "user_username" with "#{name}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /the following class_history exists/ do |class_table|
  class_table.hashes.each do |classItem|
    ClassHistory.create!(class_table)
  end
end

When(/^I fill in email with mv@citadel\.edu$/) do
  fill_in("session_email", :with => "mv@citadel.edu")
end

When(/^I fill in email with iclinton@citadel\.edu$/) do
  fill_in("session_email", :with => "iclinton@citadel.edu")
end

