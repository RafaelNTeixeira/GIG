Feature: Logout
  As a user I want to logout.

  Scenario: Logout successful
    Given I'm in "ServiceRequesterMainPage" page
    When I tap the "GIGButton" button
    And I tap the "LogoutButton" button
    Then I expect to be in "LoginPage" page

