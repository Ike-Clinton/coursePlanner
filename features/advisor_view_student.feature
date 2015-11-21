Feature: View Student Course Plans as an Advisor
  As an authenticated advisor,
  I want to view student course plans,
  and give them guidance on their plan,
  so that I can help them plan classes for next semester
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      |  
  
  
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  
  Given the following classes history exists
  | email                | class_name| crn   |
  | iclinton@citadel.edu | Introduction to Computer Science I  | 201 |
	
Scenario: Logging in as a returning student to view what courses I still need to take
    Given I am on the Course Planner Student page
    Then I should see "Introduction to Computer Science II"