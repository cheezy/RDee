module Target
  
  def browser_options(options)
    return desired_capabilities(:chrome, Selenium::WebDriver::Remote::Capabilities.chrome, options)
  end
end
