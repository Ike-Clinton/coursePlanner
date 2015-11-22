Feature: Registering A New Student
  As a new student when I click register, 
  Then I should be taken to the new user page
  So that I can register for an account
  
Background: IkeClinton@gmail.com already exist


Scenario: Navigating to the register page
  Given I am on the Course Planner Welcome page
	When I follow Register
	Then I should be on the Course Planner User Registration page
	
Scenario: Registering as a new student to record classes
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "iclinton@citadel.edu"
  When I fill in "user_name" with "Ike"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c1][]"
  And I check "classes[c2][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  And I should see "Class	Class Number Composition and Literature I	101 Introduction to Computer Science I	201"
  And I should see "And these are the classes you need to take to graduate: Class	Class Number A Modern Language"

Scenario: Attempt to register a user that already exists
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | ikeclinton@gmail.com    | Ike Clinton  | 1a             | false      |
  
  
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "ikeclinton@gmail.com"
  When I fill in "user_name" with "Ike Clinton"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner User Registration page
  And I should see "User already exists!"
