Feature: As an advisor,
  So that I can help out my students
  I want to add classes to their course plan
  
Scenario: Add more classes to student plan  
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | tom@citadel.edu    | Ike  | 1a             | false      | 
  | mv@citadel.edu     | Mike | N/A | true|

  Given the following classes history exists
  | email           | class_name                           | crn      |
  | tom@citadel.edu | Composition and Literature I         | ENGL-101 |
  | tom@citadel.edu | Introduction to Computer Science I   | CSCI-201 |
    
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "mv@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Advisor page
  When I follow Ike
  Then I should be on the Course Planner View Student page
  When I follow Here
  Then I should be on the Course Planner Advisor Add Classes page
  When I check "classes[c3][]"
  When I check "classes[c4][]"
  And I press Submit
  Then I should be on the Course Planner View Student page
  And I should see "Class	Class Number Pre-Requisites Composition and Literature I	ENGL-101 Introduction to Computer Science I	CSCI-201 A Modern Language I LANG-101 Analytic Geometry and Calculus I MATH-131"
  
