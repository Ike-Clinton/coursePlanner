Feature: View my course plan as a student
  As a returning student when I have registered and logged in
  I should be able to see my course plan based on my course history
  So that I can see what I should take next semester
  
  Background: The user iclinton@citadel.edu has already registered
    
  Given I am an authenticated student
  
  Given the following class_history exists
  | email                | class_name| crn   |
  | iclinton@citadel.edu | CSCI_201  | 12345 |
	
Scenario: Logging in as a returning student to view my course plan
    Given I am on the Course Planner Student page
    Then I should see 12345