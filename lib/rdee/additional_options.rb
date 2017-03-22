module RDee
  module AdditionalOptions

    def additional_options_for(target)
      options = {}
      options.merge!(chrome_options) if need_chrome_options? target
      options.merge!(firefox_options) if need_firefox_options? target
      options.merge!(ie_options) if need_ie_optons? target
      options.merge!(safari_options) if need_safari_options? target
      options.merge!(ios_options) if need_ios_options? target
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

    def need_ios_options?(target)
      not ios_options.nil? and target.to_s.include? 'ios'
    end

  end
end
