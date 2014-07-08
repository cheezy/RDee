module Target

  def browser_options(options)
    options[:version] = '8'
    return desired_capabilities(:ie, Selenium::WebDriver::Remote::Capabilities.internet_explorer, options)
  end
end
