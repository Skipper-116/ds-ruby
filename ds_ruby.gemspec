Gem::Specification.new do |spec|
  spec.name          = 'ds_ruby'
  spec.version       = '0.1.0'
  spec.authors       = ['Roy Chanunkha']
  spec.email         = ['your.email@example.com']

  spec.summary       = 'A simple Ruby library for data structures'
  spec.description   = 'This library provides implementations of various data structures in Ruby.'
  spec.homepage      = 'https://github.com/Skipper-116/ds-ruby.git'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
end
