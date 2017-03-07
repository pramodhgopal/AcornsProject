Given (/^I am on Redfin's homepage$/) do
  visit 'https://www.redfin.com/'
end	

Then (/^I should see the "([^"]*)" on the top right/) do |arg1|
  page.should have_content(arg1)
end 
 
When (/^I click on the Sign in link$/) do 
	find('.signInLink', :text => 'Sign In').click
end

And (/^I sign in using "([^"]*)" and password "([^"]*)" on the modal page$/) do |arg1, arg2|
	fill_in 'Email', :with => arg1
	fill_in 'Password', :with => arg2
	find('.submitButton', :text => 'Sign In').click
end

Then (/^I should be logged in as "([^"]*)"$/) do |arg1|
	sleep (1.to_i)
	page.should have_content(arg1)
end	

When (/^I search for "([^"]*)" in the search box$/) do |arg1|
    fill_in :placeholder => 'City, Address, School, Agent, ZIP', :with => arg1
end

And (/^I click search$/) do
	find(:xpath, '//*[@id="homepageTabContainer"]/div/div[2]/div[1]/div/div/div/form/div[1]/button').click
	sleep (4.to_i)
end

Then(/^I should see results for "([^"]*)"$/) do |arg1|
	page.should have_content(arg1)
end

When(/^I click on more filters$/) do
  find(:xpath, '//*[@id="wideSidepaneFilterButtonContainer"]/button/span/span[2]').click
  sleep (1.to_i)
end

And(/^I check Has Garage, New listings and Has View checkboxes$/) do 
	check 'Has garage'
	check 'New listings'
	check 'Has view'
	sleep (4.to_i)
end

Then(/^I should see some results listed on the filter page$/) do 
	page.find('.numHomes').text.scan(/\d/).join('').to_i > 0
end

When(/^I click fewer filters$/) do 
	find(:xpath, '/html/body/div[1]/div[4]/div/div[2]/div[1]/div[2]/div/button').click()
end

Then(/^I should see some results below the filters$/) do
	page.should have_selector('table tr', :minimum => 1)
end

And(/^they should match the filters selected$/) do
	page.all('.tableList tr').each do |tr|
		isNewListing = tr.all('td')[8].text.scan(/\d/).join('').to_i
		expect(isNewListing).to be < 24
		tr.click
		newpage = page.find('.ViewDetailsButton').click
		sleep (5.to_i)
		page.driver.within_window page.windows.last.handle do
			page.should have_content('Has View')
			page.should have_content('# of Garage Spaces')
			page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		end
	end	
end