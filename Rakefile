require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Downloads maxmind free DBs if required"
task :geolite_db do
  unless File.exist?('spec/support/GeoLite2-Country.mmdb')
    sh 'curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz -o spec/support/GeoLite2-Country.mmdb.gz'
    sh 'gunzip spec/support/GeoLite2-Country.mmdb.gz'
  end
end

desc "Downloads maxmind free DBs if required and runs all specs"
task get_geolite_db_and_spec: [:geolite_db, :spec]

task default: :get_geolite_db_and_spec