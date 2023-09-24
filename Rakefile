require 'rubygems'
require 'bundler'
require 'rake/testtask'

# MiniTest Task
Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
end

# We want the test task to be default.
task default: [:test]
