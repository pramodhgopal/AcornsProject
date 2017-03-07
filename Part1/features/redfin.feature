Feature: Testing Redfin's site

Scenario: Testing the logging in functionality, searching for houses 
in a city and applying filters

Given I am on Redfin's homepage
Then I should see the "Sign In" on the top right
When I click on the Sign in link
And I sign in using "strider2591@gmail.com" and password "2591Strider" on the modal page
Then I should be logged in as "Blerg"
When I search for "Irvine, CA" in the search box
And I click search
Then I should see results for "Irvine Real Estate"
When I click on more filters
And I check Has Garage, New listings and Has View checkboxes
Then I should see some results listed on the filter page
When I click fewer filters
Then I should see some results below the filters
And they should match the filters selected