Given /the following user exists/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
     User.create!(user)
  end
end

Given/^I have one user "([^\"]*)" with email "([^\"]*)" and academic class "([^\"]*)" and is advisor "([^\"]*)"$/ do |name,email, academic_class, is_advisor|
    @user = User.new(:email => email,
                   :name=>name,
                   :academic_class => academic_class,
                   :is_advisor => is_advisor)
   @user.save!
end

Given /^I am an authenticated student$/ do
  name = 'Ike'
  email = 'iclinton@citadel.edu'
  academic_class = '1a'
  is_advisor = 'false'

  steps %Q{I have one user "#{name}" with email "#{email}" and academic class "#{academic_class}" and is advisor "#{is_advisor}}
  steps %Q{I am on the Course Planner Login page}
  steps %Q{I fill in "session_email" with "#{email}"}
  steps %Q{I press "Submit"}
end

Given /^I am an authenticated advisor$/ do
  name = 'Mike'
  email = 'mv@citadel.edu'
  academic_class = '1a'
  is_advisor = 'true'

  Given %{I have one user "#{name}" with email "#{email}" and academic class "#{academic_class}" and is advisor "#{is_advisor}}
  And %{I am on the Course Planner login page}
  And %{I fill in "session_email" with "#{email}"}
  And %{I press "Submit"}
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

