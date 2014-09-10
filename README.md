# AfterDo::Logging

After do aspect for logging method start and finish

## Installation

Add this line to your application's Gemfile:

    gem 'after_do-logging'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install after_do-logging

## Usage

Configure your aspect to use ```AfterDo::Logging::Aspect``` or
```AfterDo::Logging::StateTransitionAspect```.

### Set your logger

```ruby
AfterDo::Logging.logger = logger
```

PS: Is advisable to use [after-do-loader][after_do-loader] to load your aspects.

## Contributing

1. Fork it ( https://github.com/stupied4ever/after_do-logging/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[after-do-loader]: https://github.com/rranelli/after_do-loader
