module Target

  def browser_options(options)
    options[:version] = '26'
    capabilities = remote_options_for(Selenium::WebDriver::Remote::Capabilities.firefox, options)
    if options[:url]
      return :remote, capabilities
    end
    return :firefox, capabilities
  end
end
