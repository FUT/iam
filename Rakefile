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

desc 'Precompile vendor assets'
task :precompile do |t|
  precompile_sass
  precompile_coffee
  # uglify_js
end

def precompile_sass
  Dir[File.join('vendor', 'assets', 'stylesheets', '*.sass')].each do |file|
    system "sass #{file} > #{file.gsub('.sass', '')}"
    p "File #{file} precompiled"
  end
end

def precompile_coffee
  Dir[File.join('vendor', 'assets', 'javascripts', '*.coffee')].each do |file|
    system "coffee -c #{file}"
    p "File #{file} precompiled"
  end
end

def uglify_js
  require 'uglifier'

  Dir[File.join('vendor', 'assets', 'javascripts', '*.js')].each do |file|
    javascript = File.read(file)
    File.open(file, 'w') { |f| f << Uglifier.compile(javascript) }
    p "File #{file} uglified"
  end
end
