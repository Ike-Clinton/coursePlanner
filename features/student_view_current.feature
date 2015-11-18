Feature: View my current classes as a student
  As a returning student when I have logged in
  I should be able to see my classes I have listed as completed
  So that I can see what I have taken in the past
  
  Background: The user iclinton@citadel.edu has already registered
    Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      | 
    
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  
  Given the following classes history exists
  | email                | class_name | crn   |
  | iclinton@citadel.edu | CSCI 201   | 12345 |
	
Scenario: View my current course history
    Given I am on the Course Planner Student page
    Then I should see "CSCI 201"