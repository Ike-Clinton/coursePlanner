Feature: Logging in as returning student
  As a returning student when I click login, then
  I should be able to login
  So that I can see my data from last time
  
  Background: The user iclinton@citadel.edu has already registered
    
    Given the following user exists
    
  | email                   | name | academic_class |
  | iclinton@citadel.edu    | Ike  | 1a             |
    


Scenario: Navigating to the login page
    Given I am on the Course Planner welcome page
	When I follow Login
	Then I should be on the Course Planner Login page
	
Scenario: Logging in as a student
    Given I am on the Course Planner login page
    When I enter iclinton@citadel.edu in the username box
    Then I should be on the Course Planner Login page