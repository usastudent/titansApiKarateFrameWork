
@tag
Feature: CardsExamples
  I want to use this feature to test a few basics things in class

  @tag1
  Scenario: Create a new Shuffled deck of cards 
    Given url "https://www.deckofcardsapi.com"
    When path "/api/deck/new/shuffle/"
    And method post
    And param deck_count = 1
    Then status 200
    Then print response
    And def resstatuss = response.success
    Then assert resstatuss = true
 