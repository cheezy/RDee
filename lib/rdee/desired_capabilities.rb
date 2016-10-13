module RDee
  module DesiredCapabilities

    def capabilities(platform, version, host, existing_capabilities)
      capabilities = Selenium::WebDriver::Remote::Capabilities.send platform
      capabilities.version = version unless version.nil?
      capabilities.platform = host unless host.nil?
      capabilities = existing_capabilities.merge(capabilities) if existing_capabilities
      capabilities
    end


  end
end