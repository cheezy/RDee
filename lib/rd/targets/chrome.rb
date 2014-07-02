module Target
  
  def browser_options(options)
    if options[:url]
      options[:desired_capabilities] = Selenium::WebDriver::Remote::Capabilities.chrome
      return :remote, options
    end
    return :chrome, options
  end
end
