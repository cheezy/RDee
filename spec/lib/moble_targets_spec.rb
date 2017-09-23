require 'spec_helper'

describe 'Mobile targets' do

  before(:each) do
    allow(Watir::Browser).to receive(:new)
  end

  let(:capabilities) { Selenium::WebDriver::Remote::Capabilities }

  context "when using iOS" do

    let(:caps) {
      {
          platformVersion: '1.0',
          platformName: 'iOS',
          browserName: 'Safari',
          javascript_enabled: true
      }
    }

    it 'includes iOS 9.3' do
      caps[:platformVersion] = '9.3'
      expect(capabilities).to receive(:new).with(caps)
      RDee.watir_browser :ios9_3, url: 'http://blah'
    end

    it 'includes iOS 10.2' do
      caps[:platformVersion] = '10.2'
      expect(capabilities).to receive(:new).with(caps)
      RDee.watir_browser :ios10_2, url: 'http://blah'
    end

    it 'should allow additional capabilities to be pass in via configuration' do
      ios_capabilities = {
          appiumVersion: '1.6.3',
          deviceName: 'iPhone Simulator',
          deviceOrientation: 'portrait'
      }
      RDee.configure do |config|
        config.url = 'http://blah'
        config.ios_capabilities = ios_capabilities
      end
      caps[:platformVersion] = '10.2'
      expect(capabilities).to receive(:new).with(caps.merge(ios_capabilities))
      RDee.watir_browser :ios10_2
      RDee.configure do |config|
        config.url = nil
        config.ios_capabilities = nil
      end
    end
  end

  context 'when using Android' do
    let(:caps) {
      {
          platformVersion: '1.0',
          platformName: 'Android',
          browserName: 'Browser',
          javascript_enabled: true
      }
    }

    it 'includes Android 4.4' do
      caps[:platformVersion] = '4.4'
      expect(capabilities).to receive(:new).with(caps)
      RDee.watir_browser :android4_4, url: 'http://blah'
    end

    it 'should allow additional capabilities to be pass in via configuration' do
      android_capabilities = {
          appiumVersion: '1.6.4',
          deviceName: 'Google Nexus 7 HD Emulator',
          deviceOrientation: 'portrait'
      }
      RDee.configure do |config|
        config.url = 'http://blah'
        config.android_capabilities = android_capabilities
      end
      caps[:platformVersion] = '4.4'
      expect(capabilities).to receive(:new).with(caps.merge(android_capabilities))
      RDee.watir_browser :android4_4
      RDee.configure do |config|
        config.url = nil
        config.android_capabilities = nil
      end
    end
  end
end

