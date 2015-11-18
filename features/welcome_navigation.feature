Feature: Navigating from the welcome page to the rest of the site
  As a user on the welcome page when I click the links,
  I should be taken to the appropriate pages
  So that I can easily navigate the web app
  
Scenario: Navigating to the register page
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner User Registration page
	
Scenario: Navigating to the login page
  Given I am on the Course Planner Welcome page
	When I follow Login
	Then I should be on the Course Planner Login page