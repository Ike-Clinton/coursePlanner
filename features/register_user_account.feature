Feature: Registering A New user
  As a new student when I click register, 
  Then I should be taken to the new user page
  So that I can register for an account

Scenario: Navigating to the register page
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner User Registration page
	
Scenario: Registering as a new student to record classes
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "iclinton@citadel.edu"
  When I fill in "user_name" with "Ike"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner Class Registration page
  # TODO: Add a line that checks that the user was created successfully

