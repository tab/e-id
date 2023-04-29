# E-ID

Electronic identity in Estonia and in other countries

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e-id', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install e-id

## Usage

## Development

Build docker container with compose:

```bash
docker-compose build
docker-compose up
```

Access to the container:

```bash
docker-compose exec e-id sh
```

Run rspec or rubocop checks:

```bash
/package # bundle exec rubocop
/package # bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tab/e-id. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the e-id project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tab/e-id/blob/master/CODE_OF_CONDUCT.md).
