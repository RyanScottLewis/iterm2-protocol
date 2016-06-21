# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iterm2/protocol/version'

Gem::Specification.new do |spec|
  spec.name          = "iterm2-protocol"
  spec.version       = ITerm2::Protocol::VERSION
  spec.authors       = ["Ryan Scott Lewis"]
  spec.email         = ["ryan@rynet.us"]

  spec.summary       = %q{A wrapper for the iTerm2 xterm protocol extensions.}
  spec.description   = %q{Allows for easier generation of iTerm2 escape sequences.}
  spec.homepage      = "https://github.com/RyanScottLewis/iterm2-protocol"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aspect", "~> 0.0.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7.2"
end
