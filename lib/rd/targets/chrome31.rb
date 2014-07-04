module Target

  def browser_options(options)
    options[:version] = '31'
    capabilities = remote_options_for(Selenium::WebDriver::Remote::Capabilities.chrome, options)
    if options[:url]
      return :remote, capabilities
    end
    return :firefox, capabilities
  end
  
end
