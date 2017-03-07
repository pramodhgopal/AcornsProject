# AcornsProject


Part 1: Use Redfin to test the following scenarios using Ruby, Cucumber, and Capybara: 1. Signing in with valid username and password. Verify that you are signed in. 2. Searching for a property in a city with at least 3 filters. Verify that you get results back and that each result matches your criteria.

Part 2: Use http://edmunds.mashery.com/docs/read/The_Vehicle_API to test the following scenarios using Ruby, RSpec, and Faraday: 1. Search for the make, model, year of your car and verify the response status and that the response body contains the results that match your criteria.

In order to run part 1, go into the Part 1 folder, after downloading the repo, open a CMD and type 'cucumber features\redfin.feature'. This should start the automatation in a webdriver and will continue to do so until it is finished.

Note - Wasn't able to select from dropdown, even though I could find it using the XPath. Might have been easier if the dropdown boxes had ids. I had to improvise and selected the checkboxes, as the requirements only stated that 3 filters can be used.
