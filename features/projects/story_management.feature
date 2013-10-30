Feature:
  In order to organize an iteration
  As a user
  I want to add stories from the icebox to the current iteration

@javascript
Scenario:
  Given I have a project with a list of stories
  When I view the project page
  And I find "#iteration-button-story" and click "Add to current iteration"
  And I find "#iteration-button-story" and click "Remove from iteration"
