Gem::Specification.new do |s|
  s.name        = "iam"
  s.version     = "0.0.3"
  s.author      = "Jura Koleda"
  s.email       = "fut.wrk@gmail.com"
  s.homepage    = "http://github.com/FUT/iam"
  s.summary     = "Simple account switcher for Rails."
  s.description = "Simple account switcher for Rails that automatically retrieves a few user accounts for each role and provides single-click login feature."

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_dependency 'railties', '~> 3.1'
  s.add_dependency 'coffee-rails', '~> 3.2.1'
  s.add_dependency 'gon'
  # s.add_development_dependency 'rspec', '~> 2.6.0'
  # s.add_development_dependency 'rails', '~> 3.0.9'
  # s.add_development_dependency 'rr', '~> 0.10.11' # 1.0.0 has respond_to? issues: http://github.com/btakita/rr/issues/issue/43
  # s.add_development_dependency 'supermodel', '~> 0.1.4'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
