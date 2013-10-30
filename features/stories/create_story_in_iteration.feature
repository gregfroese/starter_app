Feature: Stories
  In order to describe a unit of work to work on now
  As a user
  I want to create a story in the current iteration

Scenario: Creating a story
  Given status records exist
  And a project exists
  And I view the project page
  When I click "New story in iteration"
  And I fill in the story form
  And I click "Save Story"
  And I view the project page
  Then I see the story in the story list
