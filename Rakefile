#
# Author:: Dru Goradia (<dru@atlasdigital.tv>)
# Copyright:: Copyright (c) Atlas Digital, LLC.
# License:: none
#

if File.file?('../../Rakefile')
  load '../../Rakefile'
else
  require 'bundler/setup'

  # Build
  desc "Builds a package based on a single cookbook. Run from the cookbook's directory."
  task :build, :name do |_, args|
    Rake::Task[:foodcritic].execute
    Rake::Task[:chefspec].execute
  end

  # ChefSpec
  desc "Run ChefSpec on a cookbook."
  task :chefspec do
    sh "bundle exec rspec --color"
  end

  # Foodcritic
  desc "Runs foodcritic on the currenct cookbook."
  task :foodcritic do
    sh "bundle exec foodcritic -X spec -f any ."
  end
end

begin
  require "kitchen/rake_tasks"
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV["CI"]
end
