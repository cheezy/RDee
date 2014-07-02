module Target

  def browser_options(options)
    if options[:url]
      options[:desired_capabilities] = Selenium::WebDriver::Remote::Capabilities.firefox
      return :remote, options
    end
    return :firefox, options
  end
end
