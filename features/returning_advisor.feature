Feature: Advising My Students
  As an advisor,
  So that I can better advise my students and keep track of them
  I want to see which of my students have used the app

  Background: The user iclinton@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class |
  | mv@citadel.edu          | Mike | 1a             |

Scenario: Logging in as an advisor
    Given I am on the Course Planner Login page
	When I enter mv@citadel.edu in the username box
	Then I should be on the Course Planner Advisor page