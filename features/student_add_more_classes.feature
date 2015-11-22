Feature: Add More Classes To Course History
  As a new student when I am logged in, 
  Then I should be able to add more classes to my course history
  So that I can add classes as I complete them

Background: Iclinton has already registered and has registered the first two classes
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      | 

  Given the following classes history exists
  | email                | class_name | crn   |
  | iclinton@citadel.edu | Composition and Literature I   | 101 |
  | iclinton@citadel.edu | Introduction to Computer Science I   | 201 |
    
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
	
Scenario: Add more classes to student plan
  When I follow Here
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c3][]"
  When I check "classes[c4][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  And I should see "Here are the classes you have taken Class	Class Number Composition and Literature I	101 Introduction to Computer Science I	201 A Modern Language 101 Analytic Geometry and Calculus I"
  

