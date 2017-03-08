# AcornsProject

Objectives -
Part 1: Use Redfin to test the following scenarios using Ruby, Cucumber, and Capybara: 1. Signing in with valid username and
password. Verify that you are signed in. 2. Searching for a property in a city with at least 3 filters. Verify that you get results
back and that each result matches your criteria.

Part 2: Use http://edmunds.mashery.com/docs/read/The_Vehicle_API to test the following scenarios using Ruby, RSpec, and Faraday: 
1.Search for the make, model, year of your car and verify the response status and that the response body contains the results that
match your criteria.


Steps to run -
In order to run part 1, go into the Part1 folder, after downloading the repo, open a cmd line and type 'cucumber
features\redfin.feature'. This should start the automation in a webdriver and will continue to do so until it is finished.

In order to run part 2, go into the Part2 folder, open a cmd line and type 'rspec'. This should run the carAPI_spec.rb file and
should give you the results in the cmd line.


Notes & Problems faced - 


In part 1, I wasn't able to select from the dropdown filter after searching for a city, even though I could find it using the XPath.
Might have been easier if the dropdown boxes had ids. I had to improvise and selected the checkboxes, as the requirements only
stated that atleast 3 filters can be used(I assumed it was any 3 filters). In the final step, I couldn't really figure out how to
close the new window that opens when it checks for the checkbox values as they are on the profile page of each listing or how to
rest the window value to the original page. So unfortunately, it opens multiple tabs and might take a while to iterate through the
list and check the values.
Performance could take a hit. This could all have been avoided if I could have selected from the max price, min beds and bathroom
dropdown boxes and checked the column  tables for their values, but capybara wasn't letting me use 
select 'value', : from => 'dropdown' box or any other variation of it.


In part 2, it took me a while to understand Rspec and how to handle API calls. I tried to immediately approach the problem from a 
pure dev standpoint and lost some time trying to learn pure ruby. I finally understood how rspec was meant to be used and how the
'it' function was meant to function. I realize that the spec file I wrote might be making too many api calls, so I included some
extra api keys in the spec file. I wrote a spec_helper file and a .rspec file to make running the program easier. You only need to
run the command 'rspec' on the cmd line. I feel I could have used Faraday a bit more extensively, but felt the need to understand
the basic procedure in making a 'GET' request to an api. I originally made the calls directly, like 
get 'honda/civic?year=2008&api_key=7jewp5zzfy8jhry42m8zdkma' and tested the values like this
expect(JsonObject2['niceName']).to eq('civic')
I realized this isn't ideal as it defeats the purpose of behavior driven testing, so I assigned the input values to variables
and passed them in. It could have been done better, but given the time constraints, I just had to ensure that they work.
