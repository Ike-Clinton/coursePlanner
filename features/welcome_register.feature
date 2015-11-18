Feature: Navigating to the register page
  As a user on the welcome page when I click register, then
  I should be taken to the register page
  So that I can enter my information and log in
  
Scenario: Navigating to the register page
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner User Registration page