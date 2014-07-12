

module RDee
  class BrowserFactory

    attr_accessor :url, :persistent_http, :chrome_options, :firefox_options,
    :ie_options, :safari_options, :opera_options

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
      target = ENV['RDEE_BROWSER'].to_sym if ENV['RDEE_BROWSER']
      load "rdee/targets/#{target}.rb"
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

    def desired_capabilities(target, capabilities, options)
      options.merge! additional_options_for target
      if options[:url]
        options[:desired_capabilities] = capabilities
        target = :remote
      end
      capabilities.version = options.delete(:version) if options[:version]
      return target, options
    end

    def additional_options_for(target)
      options = {}
      options.merge!(chrome_options) if need_chrome_options? target
      options.merge!(firefox_options) if need_firefox_options? target
      options.merge!(ie_options) if need_ie_optons? target
      options.merge!(safari_options) if need_safari_options? target
      options.merge!(opera_options) if need_opera_options? target
      options
    end

    def need_chrome_options?(target)
      not chrome_options.nil? and target.to_s.include? 'chrome'
    end

    def need_firefox_options?(target)
      not firefox_options.nil? and target.to_s.include? 'firefox'
    end

    def need_ie_optons?(target)
      not ie_options.nil? and target.to_s.include? 'ie'
    end

    def need_safari_options?(target)
      not safari_options.nil? and target.to_s.include? 'safari'
    end

    def need_opera_options?(target)
      not opera_options.nil? and target.to_s.include? 'opera'
    end
  end
end
