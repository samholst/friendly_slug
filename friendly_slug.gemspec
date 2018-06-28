lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "friendly_slug/version"

Gem::Specification.new do |spec|
  spec.name          = "friendly_slug"
  spec.version       = FriendlySlug::VERSION
  spec.authors       = ["Sam Holst"]
  spec.email         = ["sawohol@gmail.com"]

  spec.summary       = %q{Generate a model specific SEO URL friendly slug.}
  spec.description   = %q{A simple SEO URL friendly slug model generator. Friendly Slug is meant to dynamically create SEO friendly URL links. It is extremely lightweight and non resource intensive. Friendly Slug ties directly into the Rails URL Helpers so you dont have to change anything. There is no need to create a Rails Migration as this gem does not add anything to your current database. You must have Active Model in your code base for this to work.}
  spec.homepage      = "https://github.com/samholst/friendly_slug"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.16"
  spec.add_development_dependency "rake", "> 10.0"
  spec.add_development_dependency "activemodel", "> 3.0"
end
