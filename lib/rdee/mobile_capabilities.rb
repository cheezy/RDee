require_relative 'mobile_devices'

module RDee
  module MobileCapabilities
    include MobileDevices

    def additional_capabilities_for(target)
      caps = {}
      caps.merge!(ios_capabilities) if mobile_platform[target].eql?('iOS') and ios_capabilities
      caps.merge!(android_capabilities) if mobile_platform[target].eql?('Android') and android_capabilities
      caps
    end

  end
end

