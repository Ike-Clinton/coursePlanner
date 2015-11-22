Feature: Test Log Out Button
  As a user,
  I want to be able to log out
  because that is a really standard feature
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name        | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike Clinton | 1a             | false      |  
  
Scenario:  
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  When I follow Logout
  Then I should be on the Course Planner Index page