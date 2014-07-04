module Target

  def browser_options(options)
    return desired_capabilities(:phantomjs, Selenium::WebDriver::Remote::Capabilities.phantomjs, options)
  end
end
