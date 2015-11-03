Feature: Logging in
  As a student when I enter my credentials
  then when I press login I should see my course planner


Scenario: Logging in as a student
    Given I am on the Course Planner welcome page
	When I press Login
	Then I should be on the Course Planner Home page



    