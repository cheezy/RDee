require 'spec_helper'

describe "Supported browser combinations" do

  let(:watir_browser) { Watir::Browser }
  let(:capabilities) { Selenium::WebDriver::Remote::Capabilities }
  let(:desired_capabilities) { double('capabilities') }

  context "for Firefox" do

    before(:each) do
      allow(capabilities).to receive(:firefox).and_return(desired_capabilities)
    end

    it "includes generic Firefox" do
      expect(watir_browser).to receive(:new).with(:firefox)
      RDee.watir_browser :firefox
    end

    it "includes Firefox 30" do
      expect(desired_capabilities).to receive(:version=).with('30')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :firefox30, url: 'http://blah'
    end

    it "includes Firefox 29" do
      expect(desired_capabilities).to receive(:version=).with('29')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :firefox29, url: 'http://blah'
    end

    it "includes Firefox 28" do
      expect(desired_capabilities).to receive(:version=).with('28')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :firefox28, url: 'http://blah'
    end

    it "includes Firefox 27" do
      expect(desired_capabilities).to receive(:version=).with('27')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :firefox27, url: 'http://blah'
    end

    it "includes Firefox 26" do
      expect(desired_capabilities).to receive(:version=).with('26')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :firefox26, url: 'http://blah'
    end
    
  end

  context "for Chrome" do

    before(:each) do
      allow(capabilities).to receive(:chrome).and_return(desired_capabilities)
    end
    
    it "includes generic Chrome" do
      expect(watir_browser).to receive(:new).with(:chrome)
      RDee.watir_browser :chrome
    end

    it "includes Chrome 35" do
      expect(desired_capabilities).to receive(:version=).with('35')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :chrome35, url: 'http://blah'
    end

    it "includes Chrome 34" do
      expect(desired_capabilities).to receive(:version=).with('34')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :chrome34, url: 'http://blah'
    end

    it "includes Chrome 33" do
      expect(desired_capabilities).to receive(:version=).with('33')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :chrome33, url: 'http://blah'
    end

    it "includes Chrome 32" do
      expect(desired_capabilities).to receive(:version=).with('32')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :chrome32, url: 'http://blah'
    end

    it "includes Chrome 31" do
      expect(desired_capabilities).to receive(:version=).with('31')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :chrome31, url: 'http://blah'
    end
  end

  context "for Internet Explorer" do

    before(:each) do
      allow(capabilities).to receive(:ie).and_return(desired_capabilities)
    end

    it "includes generic Internet Explorer" do
      expect(watir_browser).to receive(:new).with(:ie)
      RDee.watir_browser :ie
    end

    it "includes Internet Explorer 11" do
      expect(desired_capabilities).to receive(:version=).with('11')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie11, url: 'http://blah'
    end

    it "includes Internet Explorer 10" do
      expect(desired_capabilities).to receive(:version=).with('10')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie10, url: 'http://blah'
    end

    it "includes Internet Explorer 9" do
      expect(desired_capabilities).to receive(:version=).with('9')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie9, url: 'http://blah'
    end

    it "includes Internet Explorer 8" do
      expect(desired_capabilities).to receive(:version=).with('8')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie8, url: 'http://blah'
    end

    it "includes Internet Explorer 7" do
      expect(desired_capabilities).to receive(:version=).with('7')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie7, url: 'http://blah'
    end

    it "includes Internet Explorer 6" do
      expect(desired_capabilities).to receive(:version=).with('6')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :ie6, url: 'http://blah'
    end

  end

  context "for Opera" do
    
    before(:each) do
      allow(capabilities).to receive(:opera).and_return(desired_capabilities)
    end

    it "includes generic Opera" do
      expect(watir_browser).to receive(:new).with(:opera)
      RDee.watir_browser :opera
    end
    
    it "includes Opera 12" do
      expect(desired_capabilities).to receive(:version=).with('12')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :opera12, url: 'http://blah'
    end
    
    it "includes Opera 11" do
      expect(desired_capabilities).to receive(:version=).with('11')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :opera11, url: 'http://blah'
    end
    
  end

  context "for Phantomjs" do
    it "includes generic Phantomjs" do
      expect(watir_browser).to receive(:new).with(:phantomjs)
      RDee.watir_browser :phantomjs
    end
  end

  context "for Safari" do
    
    before(:each) do
      allow(capabilities).to receive(:safari).and_return(desired_capabilities)
    end

    it "includes generic Safari" do
      expect(watir_browser).to receive(:new).with(:safari)
      RDee.watir_browser :safari
    end

      it "includes Safari 7" do
      expect(desired_capabilities).to receive(:version=).with('7')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :safari7, url: 'http://blah'
    end
    
      it "includes Safari 6" do
      expect(desired_capabilities).to receive(:version=).with('6')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :safari6, url: 'http://blah'
    end
    
      it "includes Safari 5" do
      expect(desired_capabilities).to receive(:version=).with('5')
      expect(watir_browser).to receive(:new).with(:remote, url: 'http://blah', desired_capabilities: anything())
      RDee.watir_browser :safari5, url: 'http://blah'
    end
    
  end
  
end
