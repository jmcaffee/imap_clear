# ImapClear

`imap_clear` is a command line application to delete emails on an IMAP server.
It is designed to be called from a cron job on a periodic basis.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imap_clear'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imap_clear

## Usage

From the command line:

    imap_clear server-host username password

Example:

    imap_clear mail.example.com user@example.com userpassword


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmcaffee/imap_clear.

1. Fork it ( https://github.com/jmcaffee/imap_clear/fork )
1. Clone it (`git clone git@github.com:[my-github-user-name]/imap_clear.git`)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create tests for your feature branch
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

