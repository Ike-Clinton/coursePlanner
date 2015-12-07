# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create some default students
User.create!(email: 'iclinton@citadel.edu', name: 'Ike Clinton', is_advisor: 'false')
User.create!(email: 'bmcintos@citadel.edu', name: 'Ben McIntosh', is_advisor: 'false')
User.create!(email: 'jhudson@citadel.edu', name: 'James Hudson', is_advisor: 'false')
User.create!(email: 'lcook2@citadel.edu', name: 'Lance Cook', is_advisor: 'false')
User.create!(email: 'rtumbusch@citadel.edu', name: 'Ryan Tumbusch', is_advisor: 'false')

# Create a default advisor
User.create!(email: 'mv@citadel.edu', name: 'Mike Verdicchio', is_advisor: 'true')

#Create some default classes
ClassHistory.create!(email: 'iclinton@citadel.edu', class_name: 'English Composition and Literature I', crn: 'ENGL-101')
ClassHistory.create!(email: 'iclinton@citadel.edu', class_name: 'English Composition and Literature II', crn: 'ENGL-102', pre_reqs: 'ENGL-101')
ClassHistory.create!(email: 'iclinton@citadel.edu', class_name: 'Introduction to Computer Science I', crn: 'CSCI 201')


