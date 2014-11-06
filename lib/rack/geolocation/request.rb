module Rack
  module Geolocation
    module Request
      def country
        @geolocation_country ||= if geolocation?
          geolocation.country
        else
          empty_named_location
        end
      end

      def state
        @geolocation_state ||= if geolocation?
          geolocation.subdivisions.first
        else
          empty_named_location
        end
      end

      def city
        @geolocation_city ||= if geolocation?
          geolocation.city
        else
          empty_named_location
        end
      end

    private
      def geolocation?
        geolocation && geolocation.found?
      end

      def geolocation
        @geolocation ||= Rack::Geolocation::lookup(user_real_ip)
      end

      def user_real_ip
        detected_ip = http_x_real_ip || http_x_forwarded_for

        if detected_ip
          detected_ip.to_s
        else
          self.ip
        end
      end

      def http_x_real_ip
        env['HTTP_X_REAL_IP']
      end

      def http_x_forwarded_for
        env['HTTP_X_FORWARDED_FOR'] && env['HTTP_X_FORWARDED_FOR'].split(",").first.strip
      end

      def empty_named_location
        MaxMindDB::Result::NamedLocation.new({})
      end
    end
  end
end