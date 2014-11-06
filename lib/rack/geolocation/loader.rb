module Rack
  module Geolocation
    class Loader
      def initialize(app, geolocation_db_file = nil)
        if geolocation_db_file and ::File.exists? geolocation_db_file.to_s
          $geolocation_db_file = geolocation_db_file
          Rack::Request.send :include, Rack::Geolocation::Request
        end

        @app = app
      end

      def call(env)
        @app.call(env)
      end
    end
  end
end