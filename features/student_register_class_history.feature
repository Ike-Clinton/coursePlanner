Feature: Register my course history as a student
  As a new student when I am registering
  I should be able to check boxes for the classes I have taken
  So that I can record what classes I have already taken
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      |
  
  Given the following class_history exists
  |email                 | class_name | crn   |
  | iclinton@citadel.edu | CSCI 201   | 12345  |
  | iclinton@citadel.edu | CSCI 202   | 67890  |
	
Scenario: Registering as a new student to record classes
    Given I am on the Course Planner Login page
    When I fill in email with iclinton@citadel.edu
    And I press Submit
    Then I should be on the Course Planner Student page