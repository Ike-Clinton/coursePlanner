Feature: Register my course history as a student
  As a new student when I am registering
  I should be able to check boxes for the classes I have taken
  So that I can record what classes I have already taken
  
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      | 
	
Scenario: Registering as a new student to record classes
    Given I am on the Course Planner Class Registration page
    Then I should see "Programming Languages"