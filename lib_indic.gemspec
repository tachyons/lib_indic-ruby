# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lib_indic/version'

Gem::Specification.new do |spec|
  spec.name          = 'lib_indic'
  spec.version       = LibIndic::VERSION
  spec.authors       = ['Aboobacker MK']
  spec.email         = ['aboobackervyd@gmail.com']

  spec.summary       = 'Indic language processing library'
  spec.description   = 'Ruby implementation of Indic language processing library'
  spec.homepage      = 'https://github.com/lib_indic_ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency 'pry'
end
