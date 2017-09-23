Feature: RDee should work well with mobile devices on a remote selenium grid

  @mobile
  Scenario: Creating an iPhone browser on ios 8.1
    When I establish a mobile browser for ios8_1 on the remote machine using Watir
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an iPhone browser on ios 10.0
    When I establish a mobile browser for ios10_0 on the remote machine using Watir
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an iPhone browser on ios 8.2
    When I establish a mobile browser for ios8_2 on the remote machine using Watir
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an iPhone browser on ios 9.0
    When I establish a mobile browser for ios9_0 on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an iPhone browser on ios 10.2
    When I establish a mobile browser for ios10_2 on the remote machine using Watir
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an iPhone browser using RDee configuration
    When I use RDee configuration to establish an ios10_2 mobile browser
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading

  @mobile
  Scenario: Creating an Android browser on android 4.4
    When I establish a mobile android browser for android4_4 on the remote machine using Watir
    And I go to the cheezyworld site
    And I select the first title link
    Then I should see the text from the first heading
