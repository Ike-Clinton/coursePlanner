Feature: Trying To Access Pages When Not Logged In
  As a non logged in user when I go to Student or Advisor,
  I should be informed that I must log in
  So that I know I forgot to log in
  
Scenario: Navigating to the Student page not logged in
  Given I am on the Course Planner Welcome page
	When I follow Student
	Then I should be on the Course Planner Index page
	And I should see "You must be logged in to do that!"
	
Scenario: Navigating to the Advisor page not logged in
  Given I am on the Course Planner Welcome page
	When I follow Advisor
	Then I should be on the Course Planner Index page
	And I should see "You must be logged in to do that!"
	
Scenario: A logged in student tries to access the advisor page
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | iclinton@citadel.edu    | Ike  | 1a             | false      | 
    
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "iclinton@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  When I follow Advisor
  Then I should be on the Course Planner Index page
  And I should see "You must be an advisor to do that!"
	
