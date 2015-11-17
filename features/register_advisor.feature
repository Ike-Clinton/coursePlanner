Feature: Registering A New Advisor
  As a new advisor when I click register, 
  Then I should be able to declare myself as an advisor
  So my students can send their schedules to me


Scenario: Registering as a new advisor
  Given I am on the Course Planner Welcome page
  When I follow Register
  Then I should be on the Course Planner Register page
