Feature: Admin can manually add questions

Background:
  Given I am on the surveys home page
  When I follow "Create New Survey"
  Then I should be on the Create New Survey page
  When I fill in "Survey Name" with "My Test Survey"
  And I fill in "Surveyor Name" with "Mr. XYZ"
  And I press "Save Changes"
  Then I should be on the surveys home page
  And I should see "My Test Survey"

Scenario: Add a survey

  When I follow "My Test Survey"
  Then I should be on the New Questions page for XYZ
  When I fill in "Question" with "Cucumber Question"
  And I select "open_ended" from "Response Type"
  And I fill in "Response Values" with "Open ended Response"
  And I press "Save Changes"
  Then I should be on the New Questions page for XYZ
  And I should see "Cucumber Question"
