require 'spec_helper'
require 'selenium/webdriver/remote/http/persistent'

describe RDee do

  let(:watir_browser) { Watir::Browser }

  context "when getting a connection for Watir" do
    it "should create a Firefox browser by default" do
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser
    end

    it "should catch and print exceptions that occur when establishing a connection" do
      expect(watir_browser).to receive(:new).and_raise(Exception, 'foo')
      expect{ RDee.watir_browser }.to raise_error(RDee::ConnectionError, 'foo')
    end
end

  context "when getting a connection for Selenium" do
    let(:selenium_browser) { Selenium::WebDriver }

    it "should create a Firefox browser by default" do
      expect(selenium_browser).to receive(:for).with(:firefox)
      RDee.selenium_browser
    end

    it "should catch and print exceptions that occur when establishing a connection" do
      expect(selenium_browser).to receive(:for).and_raise(Exception, 'foo')
      expect{ RDee.selenium_browser }.to raise_error(RDee::ConnectionError, 'foo')
    end
end

  context "when using common functionality" do
    it "should use the BROWSER environment variable when present" do
      ENV['RDEE_BROWSER'] = 'chrome'
      expect(watir_browser).to receive(:new).with(:chrome)
      RDee.watir_browser
      ENV.delete 'RDEE_BROWSER'
    end

    it "should provide option to use persistent http client" do
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      RDee.watir_browser(:firefox, persistent_http: true)
    end

    it "should not use the persistent http client when set to false" do
      expect(Selenium::WebDriver::Remote::Http::Persistent).to_not receive(:new)
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser(:firefox, persistent_http: false)
    end

    it "should allow users to set the persistent http setting by configuration" do
      RDee.configure do |config|
        config.persistent_http = true
      end
      client = double('http_client')
      expect(Selenium::WebDriver::Remote::Http::Persistent).to receive(:new).and_return(client)
      expect(watir_browser).to receive(:new).with(:firefox, http_client: client)
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.persistent_http = nil
      end
    end

    it "should provide option to use a remote url" do
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser(:firefox, url: 'http://blah')
    end

    it "should allow users to set the remote url setting by configuration" do
      RDee.configure do |config|
        config.url = 'http://blah'
      end
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.url = nil
      end
    end

  end
  
  context "when passing additional browser options" do
    it "should allow users to add additional options for chrome by configuration" do
      RDee.configure do |config|
        config.chrome_options = {chrome_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:chrome, chrome_options: 'option')
      RDee.watir_browser(:chrome)
      RDee.configure do |config|
        config.chrome_options = nil
      end
    end

    it "should not add chrome_options when not using chrome" do
      RDee.configure do |config|
        config.chrome_options = {chrome_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.chrome_options = nil
      end
    end

    it "should allow users to add additional options for firefox by configuration" do
      RDee.configure do |config|
        config.firefox_options = {firefox_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox, firefox_options: 'option')
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.firefox_options = nil
      end
    end

    it "should not add firefox_options when not using firefox" do
      RDee.configure do |config|
        config.firefox_options = {firefox_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:chrome)
      RDee.watir_browser(:chrome)
      RDee.configure do |config|
        config.firefox_options = nil
      end
    end

    it "should allow users to add additional options for IE by configuration" do
      RDee.configure do |config|
        config.ie_options = {ie_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:ie, ie_options: 'option')
      RDee.watir_browser(:ie)
      RDee.configure do |config|
        config.ie_options = nil
      end
    end

    it "should not add ie_options when not using ie" do
      RDee.configure do |config|
        config.ie_options = {ie_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.ie_options = nil
      end
    end

    it "should allow users to add additional options for Safari by configuration" do
      RDee.configure do |config|
        config.safari_options = {safari_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:safari, safari_options: 'option')
      RDee.watir_browser(:safari)
      RDee.configure do |config|
        config.safari_options = nil
      end
    end

    it "should not add safari_options when not using safari" do
      RDee.configure do |config|
        config.safari_options = {safari_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.safari_options = nil
      end
    end

    it "should allow users to add additional options for iPhone by configuration" do
      RDee.configure do |config|
        config.iphone_options = {iphone_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:iphone, iphone_options: 'option')
      RDee.watir_browser(:iphone_ios70)
      RDee.configure do |config|
        config.iphone_options = nil
      end
    end

    it "shoudl not add iphone_options when not using iPhone" do
      RDee.configure do |config|
        config.iphone_options = {iphone_options: 'option'}
      end
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser(:firefox)
      RDee.configure do |config|
        config.iphone_options = nil
      end
    end

  end
end
