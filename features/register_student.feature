Feature: Registering
  As a student when I click register, then I 
  should be able to register my planner


Scenario: Registering as a student
    Given I am on the Course Planner welcome page
	When I follow Register
	Then I should be on the Course Planner Register page



    