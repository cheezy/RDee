
module RDee
  module MobileDevices

    def mobile?(value)
      mobile_targets.include? target_for(value)
    end

    
    def mobile_targets
      @mobile_targets ||= [
        :iphone
      ]
    end
    
  end
end
