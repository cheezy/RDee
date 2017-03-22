require_relative 'mobile_capabilities'

module RDee
  module DesiredCapabilities
    include MobileDevices
    include MobileCapabilities

    def capabilities(platform, version, host, existing_capabilities)
      existing_capabilities = {} unless existing_capabilities
      return mobile_capabilities(platform, version, existing_capabilities) if mobile?(platform)
      browser_capabilities(platform, version, host, existing_capabilities)
    end

    def browser_capabilities(platform, version, host, existing_capabilities)
      capabilities = Selenium::WebDriver::Remote::Capabilities.send platform
      capabilities.version = version unless version.nil?
      capabilities.platform = host unless host.nil?
      existing_capabilities.each do |key, value|
        capabilities[key] = value
      end
      capabilities
    end

    def mobile_capabilities(platform, version, existing_capabilities)
      existing_capabilities.merge!(additional_capabilities_for(platform))
      capabilities = Selenium::WebDriver::Remote::Capabilities
                         .new({
                                  platformVersion: version,
                                  platformName: mobile_platform[platform],
                                  browserName: mobile_browsers[platform],
                                  platform: :mac,
                                  javascript_enabled: true
                              }.merge(existing_capabilities))

    end

  end
end