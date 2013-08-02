require File.expand_path('../lib/yaml/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zoltan Toth"]
  gem.email         = ["zshun86@gmail.com"]
  gem.description   = %q{YAML CSS Framework for Rails}
  gem.summary       = %q{YAML CSS Framework for Rails}
  gem.homepage      = "https://github.com/ojji/my-yaml-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yaml-rails"
  gem.require_paths = ["lib"]
  gem.version       = Yaml::VERSION

  gem.add_dependency "jquery-rails", [">= 1.0.17"]
  gem.add_dependency "sass", [">= 3.2.0"]
  gem.add_development_dependency "rake"
end