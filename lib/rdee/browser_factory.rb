require_relative 'target_parser'
require_relative 'mobile_devices'

module RDee
  class ConnectionError < StandardError
  end
  
  class BrowserFactory
    include TargetParser

    attr_accessor :url, :persistent_http, :chrome_options, :firefox_options,
    :ie_options, :safari_options, :iphone_options

    def watir_browser(target, options)
      platform, options = platform_and_options(target, options)
      watir_browser_for(platform, options)
    end

    def selenium_browser(target, options)
      platform, options = platform_and_options(target, options)
      selenium_browser_for(platform, options)
    end

    private

    def watir_browser_for(platform, options)
      begin
        if options.empty?
          Watir::Browser.new platform
        else
          Watir::Browser.new platform, options
        end
      rescue Exception => e
        $stderr.puts e
        raise RDee::ConnectionError, e
      end
    end

    def selenium_browser_for(platform, options)
      begin
        if options.empty?
          Selenium::WebDriver.for platform
        else
          Selenium::WebDriver.for platform, options
        end
      rescue Exception => e
        $stderr.puts e
        raise RDee::ConnectionError, e
      end
    end

    def platform_and_options(target, options)
      target = ENV['RDEE_BROWSER'].to_sym if ENV['RDEE_BROWSER'] 
      platform, version, host = parse(target)
      options.merge! additional_options_for target
      capabilities = capabilities(platform, version, host)
      options[:url] = url unless url.nil?
      if options.include? :url
        platform = :remote
        options[:desired_capabilities] = capabilities
      end
      options[:http_client] = http_client if persistent_http or options.delete(:persistent_http)
      return platform, options
    end

    def capabilities(platform, version, host)
      capabilities = Selenium::WebDriver::Remote::Capabilities.send platform
      capabilities.version = version unless version.nil?
      capabilities.platform = host unless host.nil?
      capabilities
    end

    def http_client
      Selenium::WebDriver::Remote::Http::Persistent.new
    end

    def additional_options_for(target)
      options = {}
      options.merge!(chrome_options) if need_chrome_options? target
      options.merge!(firefox_options) if need_firefox_options? target
      options.merge!(ie_options) if need_ie_optons? target
      options.merge!(safari_options) if need_safari_options? target
      options.merge!(iphone_options) if need_iphone_options? target
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

    def need_iphone_options?(target)
      not iphone_options.nil? and target.to_s.include? 'iphone'
    end
  end
end
