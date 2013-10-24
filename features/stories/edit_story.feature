Feature:
  In order to reflect the current details of a story
  As a user
  I want to edit all available story fields

Background:
  Given status records exist
  Given a story exists
  Given I'm on the story index page
  When I click "Edit Story"
  Then I see story in the edit page

Scenario: Editing a story goal
  And I change the "story_goal" field to "changed"
  And I click "Save Story"
  Then I see the updated story in the story list
