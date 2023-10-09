Feature: Login
  As a user I want to login so that I can use the app.

  Scenario: Login successful
    Given I have "emailField" and "passwordField" and "LoginButton"
    When I fill the "emailField" field with "martim@gmail.com"
    And I fill the "passwordField" field with "martim"
    When I tap the "SignUpButton" button


