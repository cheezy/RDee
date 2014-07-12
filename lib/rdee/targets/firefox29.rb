module Target

  def browser_options(options)
    options[:version] = '29'
    return desired_capabilities(:firefox, Selenium::WebDriver::Remote::Capabilities.firefox, options)
  end
end
