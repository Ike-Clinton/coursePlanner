Feature: Registering A New Advisor
  As a new advisor when I click register, 
  Then I should be taken to the new user page
  So that I can register for an account

Scenario: Attempt to register an advisor that already exists
  Given the following user exists
  | email           | name | academic_class | is_advisor |
  | mv@citadel.edu  | Mike Verdicchio       | NA         | true      |
  
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "mv@citadel.edu"
  When I fill in "user_name" with "Mike Verdicchio"
  And I press Submit
  Then I should be on the Course Planner User Registration page
  And I should see "User already exists!"
