Feature: Logging in
  As a student when I click login, then
  I should be able to login


Scenario: Logging in as a student
    Given I am on the Course Planner welcome page
	When I follow Login
	Then I should be on the Course Planner Login page