Feature:
  In order to view a subset of stories
  As a user
  I want to switch between current iteration and icebox views

Scenario:
  Given I have a project with a list of stories
  When I view the project current iteration page
  Then I expect to see all stories in the icebox view
