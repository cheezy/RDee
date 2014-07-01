require 'rd/version'
require 'rd/browser_factory'

module RD

  def self.watir_browser(target = :firefox, options = {})
    factory.watir_browser(target, options)
  end

  def self.selenium_browser(target = :firefox, options = {})
    factory.watir_browser(target, options)
  end

  def self.configure
    yield factory
  end

  private

  def self.factory
    @factory ||= BrowserFactory.new
  end

end
