require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

desc 'Run all specs and cukes'
task :test => ['spec', 'features']

task :default => :test

