require "rd/version"

module RD

  def self.watir_browser(target = :firefox, options = {})
    target = ENV['BROWSER'].to_sym if ENV['BROWSER']
    load_target(target)
    watir_browser_for options
  end

  def self.selenium_browser(target = :firefox, options = {})
    target = ENV['BROWSER'].to_sym if ENV['BROWSER']
    load_target(target)
    selenium_browser_for options
  end

  private

  def self.watir_browser_for(options)
    Watir::Browser.new with_options(options)
  end

  def self.selenium_browser_for(options)
    Selenium::WebDriver.for with_options(options)
  end

  def self.load_target(target)
    require "rd/targets/#{target}"
    extend Target
  end
end
