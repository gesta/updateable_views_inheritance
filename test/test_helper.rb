plugin_test_dir = File.dirname(__FILE__)
$:.unshift(plugin_test_dir + '/../lib')

RAILS_ROOT = File.dirname(__FILE__)

require 'test/unit'
require 'rubygems'
require 'active_record'
require 'active_record/fixtures'

config = ActiveRecord::Base.configurations = YAML::load(IO.read(plugin_test_dir + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(plugin_test_dir + "/debug.log")
ActiveRecord::Base.establish_connection(config[ENV['DB']] || config['postgresql'])

require File.join(plugin_test_dir, '/../init')

class ActiveSupport::TestCase #:nodoc:
  include ActiveRecord::TestFixtures
  self.fixture_path = "#{File.dirname(__FILE__)}/fixtures/"
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
