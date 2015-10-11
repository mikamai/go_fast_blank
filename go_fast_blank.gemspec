# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_fast_blank/version'

Gem::Specification.new do |s|
  s.name = 'go_fast_blank'
  s.version = GoFastBlank::VERSION
  s.date = '2015-10-03'
  s.summary = 'Fast String blank? implementation in Go'
  s.description = 'Provides a Go-optimized method for determining if a string is blank'

  s.authors = ['Massimo Ronca']
  s.email = 'massimo@mikamai.com'
  s.homepage = 'https://github.com/wstucco/go_fast_blank'
  s.license = 'MIT'

  s.extensions = ['ext/go_fast_blank/extconf.rb']
  s.require_paths = ['lib']
  s.files =   s.files = [
    'LICENSE',
    # 'README.md',
    'benchmark',
    'lib/go_fast_blank/version.rb',
    'ext/go_fast_blank/go_fast_blank.go',
    'ext/go_fast_blank/extconf.rb',
  ]

  s.test_files = Dir['spec/**/*_spec.rb']

  s.add_development_dependency 'rake-compiler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'benchmark-ips'
end

