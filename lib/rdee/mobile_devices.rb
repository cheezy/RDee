
module RDee
  module MobileDevices

    def mobile?(value)
      mobile_targets.include? target_for(value)
    end

    
    def mobile_targets
      @mobile_targets ||= [
        :ios
      ]
    end
    
  end
end
