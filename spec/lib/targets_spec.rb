require 'spec_helper'

describe "Supported browser combinations" do

  let(:watir_browser) { Watir::Browser }


  context "for Firefox" do
    
    it "includes generic Firefox" do
      expect(watir_browser).to receive(:new).with(:firefox)
      RD.watir_browser :firefox
    end
    
  end

  context "for Chrome" do

    it "includes generic Chrome" do
      expect(watir_browser).to receive(:new).with(:chrome)
      RD.watir_browser :chrome
    end

  end

  context "for Internet Explorer" do
    it "includes generic Internet Exployer" do
      expect(watir_browser).to receive(:new).with(:ie)
      RD.watir_browser :ie
    end
  end
  
end
