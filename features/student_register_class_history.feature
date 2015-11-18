Feature: Register my course history as a student
  As a new student when I am registering
  I should be able to check boxes for the classes I have taken
  So that I can record what classes I have already taken
	
Scenario: Registering as a new student to record classes
    Given I am on the Course Planner Login page
    Then I should see checkboxes on the page for classes
    When I fill in "session_email" with "iclinton@citadel.edu"
    And I press Submit
    Then I should be on the Course Planner Student page