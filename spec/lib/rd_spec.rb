require 'spec_helper'

describe RD do

  describe "when getting a connection for Watir" do
    let(:watir_browser) { Watir::Browser }

    before(:each) do
      allow(watir_browser).to receive(:new)
    end
    
    it "should create a Firefox browser by default" do
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser
    end

    it "should use the BROWSER environment variable when present" do
      ENV['BROWSER'] = 'chrome'
      expect(watir_browser).to receive(:new).with(:chrome)
      RD.watir_browser
      ENV['BROWSER'] = nil
    end
  end

  describe "when getting a connection for Selenium" do
    let(:selenium_browser) { Selenium::WebDriver }

    before(:each) do
      allow(selenium_browser).to receive(:for)
    end

    it "should create a Firefox browser by default" do
      expect(selenium_browser).to receive(:for).with(:firefox)
      RD.selenium_browser
    end

    it "should use the BROWSER environment variable when present" do
      ENV['BROWSER'] = 'chrome'
      expect(selenium_browser).to receive(:for).with(:chrome)
      RD.selenium_browser
      ENV['BROWSER'] = nil
    end
  end
  
end
