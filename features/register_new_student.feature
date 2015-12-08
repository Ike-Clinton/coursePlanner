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
  When I fill in "user_email" with "tom@citadel.edu"
  When I fill in "user_name" with "Ike"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c1][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  
  
Scenario: Add more classes to student plan  
  Given the following user exists
  | email                   | name | academic_class | is_advisor |
  | tom@citadel.edu    | Ike  | 1a             | false      | 

  Given the following classes history exists
  | email                | class_name | crn   |
  | tom@citadel.edu | Composition and Literature I   | ENGL-101 |
  | tom@citadel.edu | Introduction to Computer Science I   | CSCI-201 |
    
  Given I am on the Course Planner Login page
  When I fill in "session_email" with "tom@citadel.edu"
  And I press Submit
  Then I should be on the Course Planner Student page
  When I follow Here
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c3][]"
  When I check "classes[c4][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  And I should see "Here Here are the classes you have taken Class Name Course Number Pre-Requisites Composition and Literature I ENGL-101 Introduction to Computer Science I CSCI-201"

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
  
Scenario: Attempt to sign up for a class that student meets pre_reqs for (happy path)
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "tom@citadel.edu"
  When I fill in "user_name" with "Tom"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c2][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  When I follow Here
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c10][]"
  And I press Submit
  Then I should be on the Course Planner Student page

Scenario: Attempt to sign up for a class that student doesn't meet pre_reqs for (sad path)
  Given I am on the Course Planner User Registration page
  When I fill in "user_email" with "tom@citadel.edu"
  When I fill in "user_name" with "Tom"
  When I fill in "user_academic_class" with "1a"
  When I fill in "user_is_advisor" with "false"
  And I press Submit
  Then I should be on the Course Planner Class Registration page
  When I check "classes[c29][]"
  And I press Submit
  Then I should be on the Course Planner Student page
  And I should see "You do not meet one or more of the pre-requisites for one of the classes you attempted to register for!"