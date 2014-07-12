module Target

  def browser_options(options)
    options[:version] = '27'
    return desired_capabilities(:firefox, Selenium::WebDriver::Remote::Capabilities.firefox, options)
  end
end
