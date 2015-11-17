Feature: Navigating to the login page
  As a user on the welcome page when I click login, then
  I should be taken to the login page
  So that I can enter my username and log in
  
Scenario: Navigating to the login page
  Given I am on the Course Planner Welcome page
	When I follow Login
	Then I should be on the Course Planner Login page