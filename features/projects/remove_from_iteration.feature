Feature:
  In order to organize an iteration
  As a user
  I want to remove stories from the current iteration

Scenario:
  Given I have a project stories in the current iteration
  When I view the project current iteration page
  And I click "Remove from iteration"
  Then I see "Removed from iteration!"