When(/^I establish a (.+) browser on the local machine using (.+)$/) do |browser, platform|
  @browser = RDee.send "#{platform.downcase}_browser", browser.downcase.to_sym
end

When(/^I establish a (.+) browser with a variable using (.+)$/) do |browser, platform|
  ENV['RDEE_BROWSER'] = "#{browser.downcase}"
  @browser = RDee.send "#{platform.downcase}_browser"
  ENV.delete 'RDEE_BROWSER'
end

When(/^I use RDee configuration to establish an (.+) mobile browser$/) do |browser|
  RDee.configure do |config|
    config.url = 'http://rdee:730071ad-7331-4d65-bd56-ec3ebfdd8232@ondemand.saucelabs.com:80/wd/hub'
    config.ios_capabilities = {
      appiumVersion:      '1.6.3',
      deviceName:         'iPhone Simulator',
      deviceOrientation:  'portrait'
    }
    @browser = RDee.watir_browser(browser.to_sym)
  end
end

When(/^I establish an? (.+) browser on the remote machine using (.+)$/) do |browser, platform|
  @browser = RDee.send "#{platform.downcase}_browser",
                       browser.to_sym,
                       url: 'http://rdee:730071ad-7331-4d65-bd56-ec3ebfdd8232@ondemand.saucelabs.com:80/wd/hub'
end

When(/^I establish an? mobile browser for (.+) on the remote machine using (.+)$/) do |browser, platform|
  mobile_options = {
      appiumVersion: '1.6.3',
      deviceName: 'iPhone Simulator',
      deviceOrientation: 'portrait'
  }
  @browser = RDee.send "#{platform.downcase}_browser",
                       browser.to_sym,
                       desired_capabilities: mobile_options,
                       url: 'http://rdee:730071ad-7331-4d65-bd56-ec3ebfdd8232@ondemand.saucelabs.com:80/wd/hub'
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

Then(/^I should see the text "(.*?)"$/) do |message|
  expect(@current_page.text).to include message
end


And(/^I select the first title link$/) do
  on(CheezyWorld) do |page|
    @first_heading = page.first_heading_element.text
    page.first_heading_element.click
  end
end

Then(/^I should see the text from the first heading$/) do
  on(CheezyWorld) do |page|
    expect(page.text).to include @first_heading
  end
end

When(/^I set switches via configuration and use a Watir browser$/) do
  ENV['RDEE_BROWSER'] = 'chrome'
  RDee.configure do |config|
    config.chrome_options = { :switches => %w[--disable-extensions]}
  end
  @browser = RDee.watir_browser
end