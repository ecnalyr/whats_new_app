Feature: catalog

    As a user
    So that I can see a catalog of existing products
    I want to be presented with a catalog containing all products

Background:

    Given 5 products exist

Scenario: User views and sorts the catalog
    When user visits the Catalog page
    Then user should see 5 products
    Then user should see "Product2" before "Product1"
    And user clicks "Name"
    Then user should see "Product1" before "Product2"