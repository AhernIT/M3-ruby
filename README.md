# M3

Access the [M3](http://www.infor.com/product-summary/erp/m3/) database. *NOTE*: this gem is currently in an alpha state and may change often without notice. This first iteration is for connecting to a local system.


## Installation

This gem is for `jruby`1.7+ Be sure to have [JRuby](http://jruby.org/) installed first.

Add this line to your application's Gemfile:

```ruby
gem 'm3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m3

## Usage

require the gem and configure it
```ruby
require 'm3'

# The configuration must be set first
M3.configure do |c|
  c.uri = "127.0.0.1:3000"  # This IP and port you connect to your M3 system with
  c.username = ENV['M3_USERNAME'] # Your M3 database username
  c.password = ENV['M3_PASSWORD'] # Your M3 database password
  c.api = "MMITEST" # Whatever API you connect to for stuff
  c.trim_whitespace = true # true by default
end
```

Setup your client
```ruby
$client = M3::Client.new
$client.connected? #=> false
$client.connect 
# if the connection is good
$client.connected? #=> true
```

Executing calls
```ruby
$client.execute('GetPriceLine', {'CUNO' => '100', 'ITNO' => '123'}) do |result|
  # if there are any errors
  # puts result.error_code #=> 7
  # puts result.last_error #=> "That item does not exist"
  
  # otherwise you can access data from the result like
  puts result[:SAPR] #=> "14.99"
end
# connections are closed after execution.
# TODO: see if the jar has a timeout option to keep sockets opened longer
$client.connected? #=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AhernIT/m3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

