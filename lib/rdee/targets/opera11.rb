module Target

  def browser_options(options)
    options[:version] = '11'
    return desired_capabilities(:opera, Selenium::WebDriver::Remote::Capabilities.opera, options)
  end
end
