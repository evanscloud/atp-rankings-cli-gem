# Emirates Tennis ATP Rankings Singles Race to London Rubygem

This gem provides a current list of ranked singles tennis players who are competing to be part of the top 8. At the end of the season in November, these top 8 players for the current year qualify to enter the Barclays ATP World Tour Finals. This list allows a user to select a player and view a multitude of information regarding that athlete of the current year.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'atp_rankings'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atp_rankings


## Dependencies

```
'nokogiri'
'open-uri'
```


## Overview

This gem will provide a list of the current top 20 players in contention to qualify for the Barclays ATP World Tour Finals. User can select a player based on there full name or a number to select a player based on that official ATP ranking number. Options to view player's bio, current activity for the year, and recent tournament played.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evanscloud/atp_rankings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
