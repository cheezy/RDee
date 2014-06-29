require 'spec_helper'
require 'selenium/webdriver/remote/http/persistent'

describe RD do

  context "when getting a connection for Watir" do
    let(:watir_browser) { Watir::Browser }

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

  describe "when using common functionality" do
    
    let(:watir_browser) { Watir::Browser }

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
  end
end
