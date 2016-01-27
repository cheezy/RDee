Feature: RDee should work well with mobile devices on a remote selenium grid

  Scenario: Creating an iPhone browser on ios 9.2
    When I establish a iphone_ios92 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 9.1
    When I establish a iphone_ios91 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 9.0
    When I establish a iphone_ios90 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 8.4
    When I establish a iphone_ios84 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 8.3
    When I establish a iphone_ios83 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 8.2
    When I establish a iphone_ios82 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 8.1
    When I establish a iphone_ios81 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 8.0
    When I establish a iphone_ios80 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 7.1
    When I establish a iphone_ios71 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 7.0
    When I establish a iphone_ios70 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 6.1
    When I establish a iphone_ios61 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone browser on ios 6.0
    When I establish a iphone_ios60 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

