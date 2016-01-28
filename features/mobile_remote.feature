Feature: RDee should work well with mobile devices on a remote selenium grid

  Scenario: Creating an iPhone 6 browser on ios 8.2
    When I establish a ios8.0_iphone_6 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPhone 5 browser on ios 8.2
    When I establish a ios8.1_iphone_5 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPad Air 2 browser on ios 9.0
    When I establish a ios9.0_iphone_air_2 browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"

  Scenario: Creating an iPad Pro browser on ios 9.2
    When I establish a ios9.2_ipad_pro browser on the remote machine using Selenium
    And I go to the cheezyworld site
    And I select the transformations link
    Then I should see the text "Cucumber Transformations Screencast"


