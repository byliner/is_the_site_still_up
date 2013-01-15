# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "is_the_site_still_up"
  gem.homepage = "http://github.com/rjspotter/is_the_site_still_up"
  gem.license = "MIT"
  gem.summary = %Q{Is the Site Still Up: A Middleware}
  gem.description = <<DESC
If you're building an application that has both online and offline functionality
it can be useful to know if the site is really still up (because you can't rely on
navigator.onLine).  This middleware allows you to poll /online or the path of your
choice and return simple text or the result of a block without involving the whole
application stack. Meaning, you can poll more frequently without melting your server.
DESC
  gem.email = "admin@byliner.com"
  gem.authors = ["Byliner Inc."]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end


task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "is_the_site_still_up #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
