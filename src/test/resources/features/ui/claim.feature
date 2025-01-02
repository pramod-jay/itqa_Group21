# Author: Nathali Fernando
# Date: 27/12/2024
# Description: Feature file for testing Claim functionality

Feature: Claim
  As a user
  I want to claim my allowance
  So that I can get my allowance approved

  Background: Successful login with valid credentials
    Given I am on the login screen
    When I enter a valid username "Admin"
    And I enter a valid password "admin123"
    And I click the Login button
    Then I should see the dashboard
    When I click the Claim button
    Then I should see the Claim screen

    # @TestCaseId("UI_TC001")
  Scenario Outline: Add an active event successfully to Claim
    When I click Configuration dropdown
    And select Events
    Then I should see Events screen
    And I click Add button on Events screen
    Then I should see Add Event screen
    Then I enter "Fuel Allowance5" for Event Name
    And I enter "Allowance for fuel 2" for Description
    And I press the toggle
    And I click event Save button
    Then I should see a message with title "<title>" and message "<message>"

    Examples:
      | title   | message            |
      | Success | Successfully Saved |

  Scenario: Adding an event that already exist
    When I click Configuration dropdown
    And select Events
    Then I should see Events screen
    And I click Add button on Events screen
    Then I should see Add Event screen
    When I enter "Fuel Allowance5" for Event Name
    Then I should see a Already exists error message below Event Name field

  Scenario Outline: Creating a Claim Request
    When I click Submit Claim button
    Then I should see Create Claim Request screen
    And I select event Travel Allowance from dropdown
    And I select Sri Lankan rupee as currency from the given dropdown
    Then I should enter remark as "Travel Allowance Remark"
    And I click Claim request Create button
    Then I should see a message with title "<title>" and message "<message>"
    Then I should see submitted claim with a reference Id

    Examples:
      | title   | message            |
      | Success | Successfully Saved |

  Scenario: Creating claim unsuccessfully without required data
    When I click Submit Claim button
    Then I should see Create Claim Request screen
    And I click Claim request Create button
    Then I should see "Required" error messages below Event and Currency fields













#  Scenario Outline: Successful leave application for three days with all the required data
#    Then I select the leave type
#    And I enter a "today" as the from date
#    And I enter a "day_after_tomorrow" as the to date
#    Then I should see the Partial Days selector
#    And I enter comments as "Leave Comment"
#    Then I click the Apply button
#    Then I should see a message with title "<title>" and message "<message>"
#
#    Examples:
#      | title   | message            |
#      | Success | Successfully Saved |
