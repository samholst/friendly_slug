lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "friendly_slug/version"

Gem::Specification.new do |spec|
  spec.name          = "friendly_slug"
  spec.version       = FriendlySlug::VERSION
  spec.authors       = ["Sam Holst"]
  spec.email         = ["sawohol@gmail.com"]

  spec.summary       = %q{Generate a model specific SEO URL friendly slug.}
  spec.description   = %q{A simple SEO URL friendly slug model generator.}
  spec.homepage      = "https://rubygems.org/gems/friendly-slug"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
