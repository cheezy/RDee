module Target

  def browser_options(options)
    options[:version] = '34'
    return desired_capabilities(:chrome, Selenium::WebDriver::Remote::Capabilities.chrome, options)
  end
  
end
