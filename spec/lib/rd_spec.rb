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

    it "should load the target module" do
      RD.watir_browser
    end
  end
  
end
