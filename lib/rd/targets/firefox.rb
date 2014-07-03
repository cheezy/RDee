module Target

  def browser_options(options)
    if options[:url]
      return :remote, remote_options_for(Selenium::WebDriver::Remote::Capabilities.firefox, options)
    end
    return :firefox, options
  end
end
