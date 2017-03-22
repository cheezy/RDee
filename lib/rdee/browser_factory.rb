require_relative 'target_parser'
require_relative 'mobile_devices'
require_relative 'desired_capabilities'
require_relative 'additional_options'

module RDee
  class ConnectionError < StandardError
  end

  class BrowserFactory
    include TargetParser
    include DesiredCapabilities
    include AdditionalOptions

    attr_accessor :url, :persistent_http
    attr_accessor :chrome_options, :firefox_options, :ie_options,
                  :safari_options, :ios_options
    attr_accessor :ios_capabilities

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
      options[:url] = url unless url.nil?
      if options.include? :url
        options[:desired_capabilities] = capabilities(platform, version, host, options[:desired_capabilities])
        platform = :remote
      end
      options[:http_client] = http_client if persistent_http or options.delete(:persistent_http)
      return platform, options
    end

    def http_client
      Selenium::WebDriver::Remote::Http::Persistent.new
    end

  end
end
