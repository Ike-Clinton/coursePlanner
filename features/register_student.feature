Feature: Registering A New Student
  As a new student when I click register, 
  Then I should be able taken to the register new student page
  So that I can record my previous classes

Scenario: Registering as a new student
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner Register page
