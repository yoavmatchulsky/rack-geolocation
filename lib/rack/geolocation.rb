require 'rack/geolocation/version'
require 'rack/geolocation/loader'
require 'rack/geolocation/request'

module Rack
  module Geolocation
    def self.db
      @geolocation_db ||= begin
        if $geolocation_db_file
          require 'maxminddb'
          MaxMindDB.new $geolocation_db_file if defined?(MaxMindDB)
        end
      end
    end

    def self.lookup(ip)
      Rack::Geolocation::db.lookup(ip)
    end
  end
end