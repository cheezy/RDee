When(/^I establish a (.+) browser on the local machine using (.+)$/) do |browser, platform|
  @browser = RDee.send "#{platform.downcase}_browser", browser.downcase.to_sym 
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
