require_relative 'mobile_devices'

module RDee
  module TargetParser
    include MobileDevices

    def parse(value)
      target = target_for(value)
      version = version_for(value)
      host = host_for(value)
      return  target, version, host
    end

    private

    def target_for(value)
      target = value.to_s.split(/\d+/)[0]
      target = target.split('_')[0] if target.include? '_'
      target.to_sym
    end

    def version_for(value)
      version = mobile_version(value) if mobile?(value)
      version = browser_version(value) unless mobile?(value)
      unless version.nil?
        version = nil if version.empty?
      end
      version
    end

    def host_for(value)
      host = value.to_s.split(/_/).slice(1..-1)
      host_lookup[host.join('_').to_sym] if host
    end

    def browser_version(value)
      value.to_s.gsub(target_for(value).to_s, '').split(/_/)[0]
    end

    def mobile_version(value)
      value.to_s.split(/_/).slice(1..-1)[0][-2,2].insert(1, '.')
    end

    def host_lookup
      @host_lookup ||= {
        win81: 'Windows 8.1',
        win8: 'Windows 8',
        win7: 'Windows 7',
        winxp: 'Windows XP',
        snow_leopard: 'OS X 10.6',
        mountain_lion: 'OS X 10.8',
        mavricks: 'OS X 10.9',
        linux: 'Linux',
        ios60: 'OS X 10.8',
        ios61: 'OS X 10.8',
        ios70: 'OS X 10.9',
        ios71: 'OS X 10.9'
      }
    end

  end
end
