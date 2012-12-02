# encoding: UTF-8
require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Default: run tests.'
task :default => :test

desc 'Run Iam unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'spec/**/*_test.rb'
  t.verbose = true
end
