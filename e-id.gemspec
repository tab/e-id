# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eid/version'

Gem::Specification.new do |spec|
  spec.name          = 'e-id'
  spec.version       = Eid::VERSION
  spec.authors       = ['tab']
  spec.email         = ['tab@users.noreply.github.com']

  spec.summary       = 'Electronic identity in Estonia and in other countries'
  spec.description   = 'Electronic identity in Estonia and in other countries'
  spec.homepage      = 'https://github.com/tab/e-id'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.6'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['changelog_uri'] = 'https://github.com/tab/e-id/blob/master/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|rspec|rubocop|github)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.3.0'
  spec.add_development_dependency 'rake', '~> 13.0.6'

  spec.metadata['rubygems_mfa_required'] = 'true'
end