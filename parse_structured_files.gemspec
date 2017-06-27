# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parse_structured_files/version"

Gem::Specification.new do |spec|
  spec.name          = "parse_structured_files"
  spec.version       = ParseStructuredFiles::VERSION
  spec.authors       = ["Lucas Di Cunzolo"]
  spec.email         = ["ldicunzolo@cespi.unlp.edu.ar"]

  spec.summary       = %q{File Parser for structured formats.}
  spec.description   = %q{A gereric file parser for structured format.}
  spec.homepage      = "http://rubygems.org/gems/parse_structured_files"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end