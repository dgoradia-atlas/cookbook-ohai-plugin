#
# Author:: Dru Goradia (<dru@atlasdigital.tv>)
# Copyright:: Copyright (c) Atlas Digital, LLC.
# License:: none
#

require 'chefspec'
require 'chefspec/berkshelf'

# Used for custom libraries
# lib = File.expand_path('../../libraries', __FILE__)
# $:.unshift(lib) unless $:.include?(lib)

RSpec.configure do |config|
  # Specify the path for Chef Solo to find cookbooks
  # config.cookbook_path = '/var/cookbooks'

  # Specify the path for Chef Solo to find roles
  # config.role_path = '/var/roles'

  # Specify the Chef log_level (default: :warn)
  # config.log_level = :debug

  # Specify the path to a local JSON file with Ohai data
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from
  # config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from
  # config.version = '12.04'

  # config.fail_fast = true
end

def parse_data_bag (path)
  data_bags_path = File.expand_path(File.join(File.dirname(__FILE__), "../integration/data_bags"))
  return JSON.parse(File.read("#{data_bags_path}/#{path}"))
end
