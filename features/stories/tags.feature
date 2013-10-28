Feature:
	In order to group similar stories
	As a user
	I want to add tags to a story

Scenario:
	Given status records exist
	And a story exists
	When I edit a story
	And I change the "Tag list" field to "one, two, one"
	And I click "Save Story"
	Then "Tag list" contains "one, two"