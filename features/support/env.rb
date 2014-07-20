
require 'rspec'
require 'watir-webdriver'
require 'selenium-webdriver'

World(PageObject::PageFactory)

After do
  @browser.close
end

