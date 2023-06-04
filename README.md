# E-ID

Electronic identity in Estonia and in other countries

## Supported countries

- [x] Estonia
- [x] Finland
- [ ] Sweden
- [x] Lithuania
- [ ] Latvia
- [ ] Denmark

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'e-id', '~> 0.2.0'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install e-id
```

## Usage

### Estonia

Identity code format is `GYYMMDDSSSC`

* `G` – gender
* `YYMMDD` – date of birth
* `SSS` – serial number
* `C` – checksum

More info: https://www.id.ee/en/

```bash
irb -I lib
require 'e-id'

Eid::Estonia.new(50001029996).valid?
=> true

Eid::Estonia.new(50001029996).gender
=> :female

Eid::Estonia.new(50001029996).birth_date
=> #<Date: 2000-01-02 ((2451546j,0s,0n),+0s,2299161j)>

Eid::Estonia.new(50001029996).age
=> 23
```

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
