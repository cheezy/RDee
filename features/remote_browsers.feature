Feature: RDee should work well with browsers on a remote selenium grid


  Scenario: Creating a browser on the remote machine using Selenium
    When I establish a firefox browser on the remote machine using Selenium
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on the remote machine using Watir
    When I establish a firefox browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Windows 8.1
    When I establish a chrome32_win81 browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Windows 8
    When I establish a chrome32_win8 browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Windows 7
    When I establish a chrome32_win7 browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Windows XP
    When I establish a chrome32_winxp browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Snow Leopard
    When I establish a chrome32_snow_leopard browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Mountain Lion
    When I establish a chrome32_mountain_lion browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Mavricks
    When I establish a chrome32_mavricks browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection

  Scenario: Creating a browser on Linux
    When I establish a chrome32_linux browser on the remote machine using Watir
    Then I should be able to perform a google search for cheezyworld
    And I should be able to close the connection


