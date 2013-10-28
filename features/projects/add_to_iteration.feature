Feature:
  In order to organize an iteration
  As a user
  I want to add stories from the icebox to the current iteration

@javascript
Scenario:
  Given I have a project with a list of stories
  When I view the project icebox page
  And I click "Add to current iteration"
  Then I see "Added to iteration!"
