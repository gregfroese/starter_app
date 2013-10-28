Feature: Creating projects
  In order to group stories by company projects
  As a user
  I want to create a new project

Scenario: Creating a project
  Given I am on the project list page
  When I click the "Create project" link
  And fill in the "project_name" field with "My project"
  And click the "Create Project" button
  And I visit the project list
  Then I see "My project"