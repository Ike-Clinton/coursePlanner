Feature: Registering A New Student
  As a new student when I click register, 
  Then I should be taken to the new user page
  So that I can register for an account

Scenario: Navigating to the register page
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner User Registration page
	
Scenario: Registering as a new student to record classes
  Given I am on the Course Planner User Registration page
  When I fill in email with iclinton@citadel.edu
  When I fill in name with Ike
  When I fill in academic_class with 1a
  When I fill in is_advisor with false
  And I press Submit
  Then I should be on the Course Planner Class Registration page

