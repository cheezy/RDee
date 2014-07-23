Feature: RDee should work well with browsers when target is set via environment variable

  Since I only have a Mac I will test Firefox, Chrome, and Safari

  Scenario: Creating a Firefox browser with a variable using Selenium
    When I establish a Firefox browser with a variable using Selenium
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a Firefox browser with a variable using Watir
    When I establish a Firefox browser with a variable using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a Chrome browser with a variable using Selenium
    When I establish a Chrome browser with a variable using Selenium
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a Chrome browser with a variable using Watir
    When I establish a Chrome browser with a variable using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a Safari browser with a variable using Selenium
    When I establish a Safari browser with a variable using Selenium
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a Safari browser with a variable using Watir
    When I establish a Safari browser with a variable using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  
