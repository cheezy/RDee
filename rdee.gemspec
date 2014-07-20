# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdee/version'

Gem::Specification.new do |spec|
  spec.name          = "RDee"
  spec.version       = RDee::VERSION
  spec.authors       = ["Jeffrey S. Morgan"]
  spec.email         = ["jeff.morgan@leandog.com"]
  spec.summary       = %q{Dynamically create a connection for Selenium or Watir.}
  spec.description   = %q{Dynamically create a connection for Selenium or Watir selecting the browser, version, and host os.}
  spec.homepage      = "https://github.com/cheezy/RDee"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'watir-webdriver', '>= 0.6.10'
  spec.add_dependency 'net-http-persistent'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "page-object"
end
