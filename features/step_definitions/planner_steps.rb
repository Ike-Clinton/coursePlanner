Given /the following user exists/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
     User.create!(user)
  end
end

When(/^I fill in username with mv@citadel\.edu$/) do
  fill_in(username, :with => "mv@citadel.edu")
end

When(/^I fill in username with iclinton@citadel\.edu$/) do
  fill_in(username, :with => "iclinton@citadel.edu")
end

