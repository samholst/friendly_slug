require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.pattern = 'friendly_slug_gem_test/test/**/*_test.rb'
  t.verbose = false
end

task default: :test
