Given /the following user exists/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
     User.create!(user)
  end
end

Given /the following classes history exists/ do |class_table|
  class_table.hashes.each do |classItem|
    ClassHistory.create!(classItem)
  end
end

