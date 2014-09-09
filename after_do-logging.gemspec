lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'after_do/logging/version'

Gem::Specification.new do |spec|
  spec.name          = 'after_do-logging'
  spec.version       = AfterDo::Logging::VERSION
  spec.authors       = ['Rafael da Silva', 'Renan Ranelli']
  spec.email         = ['rubygems@rafaelalmeida.net', 'renanranelli@gmail.com']
  spec.summary       = 'After do aspect for logging method start and finish.'
  spec.description   = 'After do aspect for logging method start and finish.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'after_do', '~> 0.3'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'git-hooks', '~> 0.2'
end
