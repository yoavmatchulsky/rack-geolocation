require 'maxminddb'
require 'rack/geolocation/version'
require 'rack/geolocation/loader'
require 'rack/geolocation/request'

module Rack
  module Geolocation
    def self.geolocation_db_file=(path)
      @@geolocation_db_file = if ::File.exists? path
        path
      else
        nil
      end
    end

    def self.db
      @@geolocation_db ||= begin
        if @@geolocation_db_file
          ::MaxMindDB.new @@geolocation_db_file if defined?(::MaxMindDB)
        end
      end
    end

    def self.lookup(ip = nil)
      Rack::Geolocation::db.lookup(ip) if ip
    end
  end
end