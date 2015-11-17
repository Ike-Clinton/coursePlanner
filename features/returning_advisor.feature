Feature: Logging in as a returning advisor
  As an advisor,
  So that I can better advise my students and keep track of them
  I want to see which of my students have used the app

  Background: The user mv@citadel.edu has already registered
    
  Given the following user exists
  | email                   | name | academic_class |
  | mv@citadel.edu          | Mike | 1a             |

Scenario: Logging in as an advisor
  Given I am on the Course Planner Login page
	When I fill in username with mv@citadel.edu
	And I click submit
	Then I should be on the Course Planner Advisor page