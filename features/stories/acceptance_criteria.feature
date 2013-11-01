Feature:
  In order to keep track of the success of a new feature
  As a user
  I want to record and track acceptance criteria on a story

Scenario:
  Given status records exist
  And a story exists
  When I view the story page
  And I add acceptance criteria
  And I click "Add Acceptance Criteria"
  Then I see the acceptance criteria on the show page
