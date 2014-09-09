When(/^I establish a (.+) browser on the local machine using (.+)$/) do |browser, platform|
  @browser = RDee.send "#{platform.downcase}_browser", browser.downcase.to_sym 
end

When(/^I establish a (.+) browser with a variable using (.+)$/) do |browser, platform|
  ENV['RDEE_BROWSER'] = "#{browser.downcase}"
  @browser = RDee.send "#{platform.downcase}_browser"
  ENV.delete 'RDEE_BROWSER'
end

When(/^I establish a (.+) browser on the remote machine using (.+)$/) do |browser, platform|
  @browser = RDee.send "#{platform.downcase}_browser",
  browser.to_sym, url: 'http://rdee:730071ad-7331-4d65-bd56-ec3ebfdd8232@ondemand.saucelabs.com:80/wd/hub'
end

Then(/^I should be able to perform a google search for cheezyworld$/) do
  visit(GoogleSearch) do |page|
    page.perform_search
    page.wait_until do
      page.text.include? 'extremely cheezy'
    end
  end
end

Then(/^I should be able to close the connection$/) do
  @browser.close
end

When(/^I go to the cheezyworld site$/) do
  visit CheezyWorld
end

When(/^I select the transformations link$/) do
  on(CheezyWorld).transformations_element.click
end

Then(/^I should see the text "(.*?)"$/) do |message|
  expect(@current_page.text).to include message
end
