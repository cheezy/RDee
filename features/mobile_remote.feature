Feature: RDee should work well with mobile devices on a remote selenium grid

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

