

class BrowserFactory

  attr_accessor :url, :persistent_http

  def watir_browser(target, options)
    load_target(target)
    watir_browser_for options
  end

  def selenium_browser(target, options)
    load_target(target)
    selenium_browser_for options
  end

  private

  def watir_browser_for(options)
    Watir::Browser.new with_options(options)
  end

  def selenium_browser_for(options)
    Selenium::WebDriver.for with_options(options)
  end

  def load_target(target)
    target = ENV['BROWSER'].to_sym if ENV['BROWSER']
    require "rd/targets/#{target}"
    self.class.include Target
  end

end
