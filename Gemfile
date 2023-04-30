# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gemspec

group :development, :test do
  gem 'rspec', '~> 3.12.0'
  gem 'rubocop', '~> 1.50.2'
  gem 'rubocop-performance', '~> 1.17.1'
  gem 'rubocop-rspec', '~> 2.20.0'
end

group :test do
  gem 'simplecov', '~> 0.22.0'
end
