Feature: Logging in as returning student
  As a returning student when I click login, then
  I should be able to login
  So that I can see my data from last time
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class |
  | iclinton@citadel.edu    | Ike  | 1a             |
	
Scenario: Logging in as a returning student
    Given I am on the Course Planner Login page
    When I fill in email with iclinton@citadel.edu
    And I press Submit
    Then I should be on the Course Planner Student page