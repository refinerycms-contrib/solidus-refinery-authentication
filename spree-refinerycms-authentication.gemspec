# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "spree-refinerycms-authentication"
  gem.version       = "3.0.0"
  gem.authors       = ["Adrian Macneil", "Philip Arndt", "Brice Sanchez"]
  gem.email         = ["adrian@crescendo.net.nz"]
  gem.description   = "Configure Refinery to use Spree for authentication"
  gem.summary       = "Spree has a pluggable authentication system. This gem will tell Refinery to use Spree user model and authentication."
  gem.homepage      = "https://github.com/bricesanchez/spree-refinery-authentication"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'spree'
  gem.add_runtime_dependency 'refinerycms'
  gem.add_runtime_dependency 'zilch-authorisation'
end
