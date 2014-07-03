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
    it "includes generic Internet Explorer" do
      expect(watir_browser).to receive(:new).with(:ie)
      RD.watir_browser :ie
    end
  end

  context "for Opera" do
    it "includes generic Opera" do
      expect(watir_browser).to receive(:new).with(:opera)
      RD.watir_browser :opera
    end
  end

  context "for Phantomjs" do
    it "includes generic Phantomjs" do
      expect(watir_browser).to receive(:new).with(:phantomjs)
      RD.watir_browser :phantomjs
    end
  end

  context "for Safari" do
    it "includes generic Safari" do
      expect(watir_browser).to receive(:new).with(:safari)
      RD.watir_browser :safari
    end
  end
  
end
