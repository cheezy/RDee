

class BrowserFactory

  attr_accessor :url, :persistent_http

  def watir_browser(target, options)
    load_target(target)
    platform, parameters = platform_and_parameters(options)
    watir_browser_for(platform, parameters)
  end

  def selenium_browser(target, options)
    load_target(target)
    platform, parameters = platform_and_parameters(options)
    selenium_browser_for(platform, parameters)
  end

  private

  def watir_browser_for(platform, parameters)
    if parameters.empty?
      Watir::Browser.new platform
    else
      Watir::Browser.new platform, parameters
    end
  end

  def selenium_browser_for(platform, parameters)
    if parameters.empty?
      Selenium::WebDriver.for platform
    else
      Selenium::WebDriver.for platform, parameters
    end      
  end

  def load_target(target)
    target = ENV['BROWSER'].to_sym if ENV['BROWSER']
    load "rd/targets/#{target}.rb"
    self.class.include Target
  end

  def platform_and_parameters(options)
    options[:url] = url unless url.nil?
    platform, parameters = browser_options(options)
    if options.delete(:persistent_http) or persistent_http == true
      parameters[:http_client] = http_client
    end
    return platform, parameters
  end

  def http_client
    Selenium::WebDriver::Remote::Http::Persistent.new
  end

  def remote_options_for(capabilities, options)
    options[:desired_capabilities] = capabilities
    options
  end

end
