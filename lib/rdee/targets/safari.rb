module Target

  def browser_options(options)
    return desired_capabilities(:safari, Selenium::WebDriver::Remote::Capabilities.safari, options)
  end
end
