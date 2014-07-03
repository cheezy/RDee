module Target

  def browser_options(options)
    if options[:url]
      return :remote, remote_options_for(Selenium::WebDriver::Remote::Capabilities.internet_explorer, options)
    end
    return :ie, options
  end
end
