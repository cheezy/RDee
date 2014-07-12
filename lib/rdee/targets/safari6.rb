module Target

  def browser_options(options)
    options[:version] = '6'
    return desired_capabilities(:safari, Selenium::WebDriver::Remote::Capabilities.safari, options)
  end
end
