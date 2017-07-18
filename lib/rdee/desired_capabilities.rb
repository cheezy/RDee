require_relative 'mobile_capabilities'

module RDee
  module DesiredCapabilities
    include MobileDevices
    include MobileCapabilities

    def capabilities(platform, version, host, existing_caps)
      existing_caps = {} unless existing_caps
      return mobile_capabilities(platform, version, existing_caps) if mobile?(platform)
      browser_capabilities(platform, version, host, existing_caps)
    end

    private

    def browser_capabilities(platform, version, host, existing_caps)
      capabilities = Selenium::WebDriver::Remote::Capabilities.send platform
      capabilities.version = version unless version.nil?
      capabilities.platform = host unless host.nil?
      existing_caps.each do |key, value|
        capabilities[key] = value
      end
      capabilities
    end

    def mobile_capabilities(platform, version, existing_caps)
      existing_caps.merge!(additional_capabilities_for(platform))
      Selenium::WebDriver::Remote::Capabilities.new(
          {
              platformVersion: version,
              platformName: mobile_platform[platform],
              browserName: mobile_browsers[platform],
              platform: :mac,
              javascript_enabled: true
          }.merge(existing_caps))
    end
  end
end