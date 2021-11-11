# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qiita_marker/version'

Gem::Specification.new do |s|
  s.name = 'qiita_marker'
  s.version = QiitaMarker::VERSION
  s.summary = 'CommonMark parser and renderer. Written in C, wrapped in Ruby.'
  s.description = 'A fast, safe, extensible parser for CommonMark. This wraps the official libcmark library.'
  s.authors = ['Garen Torikian', 'Ashe Connor']
  s.homepage = 'https://github.com/gjtorikian/qiita_marker'
  s.license = 'MIT'

  s.files         = %w[LICENSE.txt README.md Rakefile qiita_marker.gemspec bin/qiita_marker]
  s.files        += Dir.glob('lib/**/*.rb')
  s.files        += Dir.glob('ext/qiita_marker/*.*')
  s.test_files    = Dir.glob('test/**/*').reject { |f| f == 'test/benchinput.md' || f.start_with?('test/progit/') }
  s.extensions    = ['ext/qiita_marker/extconf.rb']

  s.executables = ['qiita_marker']
  s.require_paths = %w[lib ext]
  s.required_ruby_version = ['>= 2.6', '< 4.0']

  s.rdoc_options += ['-x', 'ext/qiita_marker/cmark/.*']

  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'json', '~> 2.3'
  s.add_development_dependency 'minitest', '~> 5.6'
  s.add_development_dependency 'minitest-focus', '~> 1.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rake-compiler', '~> 0.9'
  s.add_development_dependency 'rdoc', '~> 6.2'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-standard'
end