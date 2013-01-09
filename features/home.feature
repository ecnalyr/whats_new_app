Feature: home

    As a user
    So that I can see a quick summary of new products for every store
    I want to be presented with a summary of each store's new products

Background:

    Given 20 products exist for each of 2 stores

Scenario: User views the home page
    When user visits the Home page
    Then user should see 2 store summaries
    And each summary should contain 16 product summaries