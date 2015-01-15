# TinyHttpParser

Simple tool for fetching urls over internet

## Installation

Add this line to your application's Gemfile:

    gem 'tiny_http_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiny_http_parser

## Usage

require 'tiny_parser'

fetcher = FetcherFromEnum.new ['http://ya.ru','http://google.com']
fetcher.on_content_get do |content|
	puts '[+]'+ content.slice(0, 10)
end

fetcher.on_exception_raised do |e|
	puts e
end

fetcher.perform

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tiny_http_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
