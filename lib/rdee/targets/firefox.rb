module Target

  def browser_options(options)
    return desired_capabilities(:firefox, Selenium::WebDriver::Remote::Capabilities.firefox, options)
  end
end
