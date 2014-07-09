require 'spec_helper'
require 'selenium/webdriver/remote/http/persistent'

describe RD do

  let(:watir_browser) { Watir::Browser }

  context "when getting a connection for Watir" do
    it "should create a Firefox browser by default" do
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser
    end
  end

  context "when getting a connection for Selenium" do
    let(:selenium_browser) { Selenium::WebDriver }

    it "should create a Firefox browser by default" do
      expect(selenium_browser).to receive(:for).with(:firefox)
      RD.selenium_browser
    end
  end

  context "when using common functionality" do
    it "should use the BROWSER environment variable when present" do
      ENV['BROWSER'] = 'chrome'
      expect(watir_browser).to receive(:new).with(:chrome)
      RD.watir_browser
      ENV.delete 'BROWSER'
    end

    it "should provide option to use persistent http client" do
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      RD.watir_browser(:firefox, persistent_http: true)
    end

    it "should not use the persistent http client when set to false" do
      expect(Selenium::WebDriver::Remote::Http::Persistent).to_not receive(:new)
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser(:firefox, persistent_http: false)
    end

    it "should allow users to set the persistent http setting by configuration" do
      RD.configure do |config|
        config.persistent_http = true
      end
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.persistent_http = nil
      end
    end

    it "should provide option to use a remote url" do
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RD.watir_browser(:firefox, url: 'http://blah')
    end

    it "should allow users to set the remote url setting by configuration" do
      RD.configure do |config|
        config.url = 'http://blah'
      end
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.url = nil
      end
    end
  end
  
  context "when passing additional browser options" do
    it "should allow users to add additional options for chrome by configuration" do
      RD.configure do |config|
        config.chrome_options = {chrome_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:chrome, chrome_options: 'option')
      RD.watir_browser(:chrome)
      RD.configure do |config|
        config.chrome_options = nil
      end
    end

    it "should not add chrome_options when not using chrome" do
      RD.configure do |config|
        config.chrome_options = {chrome_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.chrome_options = nil
      end
    end

    it "should allow users to add additional options for firefox by configuration" do
      RD.configure do |config|
        config.firefox_options = {firefox_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox, firefox_options: 'option')
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.firefox_options = nil
      end
    end

    it "should not add firefox_options when not using firefox" do
      RD.configure do |config|
        config.firefox_options = {firefox_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:chrome)
      RD.watir_browser(:chrome)
      RD.configure do |config|
        config.firefox_options = nil
      end
    end

    it "should allow users to add additional options for IE by configuration" do
      RD.configure do |config|
        config.ie_options = {ie_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:ie, ie_options: 'option')
      RD.watir_browser(:ie)
      RD.configure do |config|
        config.ie_options = nil
      end
    end

    it "should not add ie_options when not using ie" do
      RD.configure do |config|
        config.ie_options = {ie_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.ie_options = nil
      end
    end

    it "should allow users to add additional options for Safari by configuration" do
      RD.configure do |config|
        config.safari_options = {safari_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:safari, safari_options: 'option')
      RD.watir_browser(:safari)
      RD.configure do |config|
        config.safari_options = nil
      end
    end

    it "should not add safari_options when not using safari" do
      RD.configure do |config|
        config.safari_options = {safari_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser(:firefox)
      RD.configure do |config|
        config.safari_options = nil
      end
    end
  end
end
