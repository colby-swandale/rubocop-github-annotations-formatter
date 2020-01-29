# Github Annotation Rubocop Formatter

This gem adds support for rendering Rubocop errors into Github Annotations.

![example github annotation](https://raw.githubusercontent.com/colby-swandale/rubocop-github-annotations-formatter/master/resources/example.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-github-annotations-formatter', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubocop-github-annotations-formatter

## Usage

**Note:** Rubocop must be executed inside [Github Actions](https://github.com/features/actions) for Annotations to work, using a 3rd party CI service like Travis-CI or CircleCI won't render any annotations.

Append your `.rubocop.yml` file to load the formatter

```yaml
require:
  - rubocop-github-annotation-formatter
```

Then append your CI scripts to run rubocop with:

    bundle exec rubocop --format RubocopGithubAnnotationFormatter::AnnotationFormatter

You can have multiple different sets of output to maintain your current setup:

    bundle exec rubocop --format progress --format RubocopGithubAnnotationFormatter::AnnotationFormatter

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/colby-swandale/rubocop-github-annotations-formatter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rubocop-github-annotations-formatter/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubocop::Github::Annotations::Formatter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubocop-github-annotations-formatter/blob/master/CODE_OF_CONDUCT.md).
