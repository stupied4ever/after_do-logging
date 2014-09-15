# AfterDo::Logging

This gem provides classes for logging method's invocation start and finish using
the amazing [after_do](https://github.com/PragTob/after_do) gem. Theses classes
are compatible with the interface defined by the
[after_do-loader](https://github.com/rranelli/after_do-loader) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'after_do-logging'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install after_do-logging

## Usage

### Set your logger

The first thing to do is tell `AfterDo::Logging` which logger it should use by
setting the class variable `AfterDo::Logging.logger`.

```ruby
AfterDo::Logging.logger = logger
# or, if you use Rails
AfterDo::Logging.logger = Rails.logger
```

### Applying the log callbacks

You can apply the logging callbacks using:

```ruby
AfterDo::Logging::Aspect.new(MyClass).log_start(:method_to_log)
AfterDo::Logging::Aspect.new(MyClass).log_finish(:method_to_log)
```

This will log a message before _and_ after invoking `MyClass#method_to_log`.

Although, the best way to do this is by using `after_do-loader` to apply the
callbacks in a dynamic and unobtrusive way. Configure your aspect to use
`AfterDo::Logging::Aspect` or `AfterDo::Logging::StateTransitionAspect`.

## Contributing

1. Fork it ( https://github.com/stupied4ever/after_do-logging/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[after-do-loader]: https://github.com/rranelli/after_do-loader
