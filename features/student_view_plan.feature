Feature: View my course plan as a student
  As a returning student when I have registered and logged in
  I should be able to see my course plan based on my course history
  So that I can see what I should take next semester
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      |  
  
  
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  
  Given the following class_history exists
  | email                | class_name| crn   |
  | iclinton@citadel.edu | CSCI_201  | 12345 |
	
Scenario: Logging in as a returning student to view my course plan
    Given I am on the Course Planner Student page
    Then I should see 12345