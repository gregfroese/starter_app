Feature:
  In order to group stories together for a sprint
  As a user
  I want to add stories to an iteration

Scenario:
  Given status records exist
  And I have a project with a list of stories
  Then I expect to see 0 iterations on the project page
