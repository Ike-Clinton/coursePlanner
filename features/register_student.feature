Feature: Registering A New Student
  As a new student when I click register, 
  Then I should be able to fill in the classes I have taken
  So that I can plan my classes


Scenario: Registering as a new student
  Given I am on the Course Planner Login page
	When I follow Register
	Then I should be on the Course Planner Register page



    