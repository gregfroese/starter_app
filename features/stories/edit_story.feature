Feature:
  In order to reflect the current details of a story
  As a user
  I want to edit a story

Scenario: Editing a story
  Given status records exist
  Given a story exists
  Given I'm on the project story list
  When I click "Edit Story"
  Then I see story in the edit page
  And I change the "story_goal" field to "changed goal"
  And I change the "story_stakeholder" field to "changed stakeholder"
  And I change the "story_behavior" field to "changed behavior"
  And I select "1" for "story_business_value"
  And I select "2" for "story_complexity_value"
  And I click "Save Story"
  Then I see the updated values in the edit story page
