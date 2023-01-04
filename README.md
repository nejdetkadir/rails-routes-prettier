[![Gem Version](https://badge.fury.io/rb/rails-routes-prettier.svg)](https://badge.fury.io/rb/rails-routes-prettier)
![test](https://github.com/nejdetkadir/rails-routes-prettier/actions/workflows/test.yml/badge.svg?branch=main)
![rubocop](https://github.com/nejdetkadir/rails-routes-prettier/actions/workflows/rubocop.yml/badge.svg?branch=main)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby_version->=_2.7.0-blue.svg)

# Rails::Routes::Prettier

The `rails-routes-prettier` gem makes it easy to view the routes in your Rails application. It converts the routes into a clear and readable format, making it simple to understand the structure of your application's routing. Whether you're a beginner or an experienced Rails developer, this gem is a valuable tool for navigating and understanding the routes in your application

## Installation

Install the gem and add to the application's Gemfile by executing:
```bash
$ bundle add rails-routes-prettier
```

Or add the following line to the application's Gemfile:
```ruby
gem 'rails-routes-prettier', github: 'nejdetkadir/rails-routes-prettier', branch: 'main'
```

If bundler is not being used to manage dependencies, install the gem by executing:
```bash
gem install rails-routes-prettier
```

## Usage

To view the routes in your application, you can use the following code:

```ruby
Rails::Routes::Prettier.all
# => [#<Route name: 'root', verb: 'GET', path: '/', controller: 'SwaggerController', action: 'index' req_options: {}>, ...]
```

This will display all of the routes in your application in a clean and readable format. You can also search for routes by certain fields using the following methods:

- `find_by_name`: Searches for routes by name.
- `find_by_verb`: Searches for routes by HTTP verb.
- `find_by_path`: Searches for routes by path.
- `find_by_req_options`: Searches for routes by requirements options.
- `find_by_controller`: Searches for routes by controller.
- `find_by_action`: Searches for routes by action.

For example, you can search for a route with the verb `GET` by using the following code:

```ruby
Rails::Routes::Prettier.find_by_verb('GET')
# => [#<Route name: 'root', verb: 'GET', path: '/', controller: 'SwaggerController', action: 'index' req_options: {}>, ...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nejdetkadir/rails-routes-prettier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nejdetkadir/rails-routes-prettier/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rails::Routes::Prettier project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nejdetkadir/rails-routes-prettier/blob/main/CODE_OF_CONDUCT.md).
