# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leshua_pay/version'

Gem::Specification.new do |spec|
  spec.name          = "leshua_pay"
  spec.version       = LeshuaPay::VERSION
  spec.authors       = ["Tony Tong"]
  spec.email         = ["tony.tong@striking.ly"]
  spec.summary       = %q{A gem to deal with Wechat payment.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'builder'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"

  spec.add_development_dependency "fakeweb"
  spec.add_development_dependency "awesome_print"
end
