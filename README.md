# PostgresFulltextSearchHelper

This is just a quick helper gem for Nulogy's extremely naive full text search powered autocomplete. It abstracts away a lot of the flexibility of the postgres full text search API in favour of a very simple API that fulfills our simple needs.

This gem can be used to sanitize user input for safe queries into postgres's tsquery language, and will generate somewhat predictable results. All characters that are meaningful to the tsquery language are simply filtered out and interpreted as a boolean '&', which we find to be effective enough for the purposes of autocomplete.

## Installation

Add this line to your application's Gemfile:

    gem 'postgres-fulltext-search-helper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postgres-fulltext-search-helper

## Usage

```PostgresFulltextSearchHelper.format_query_for_fulltext("my query")``` will return a string that is suitable for insertion into a tsquery string for postgres.

If you're using Active Record or another library that implements ```where``` on a scope in a similar manner to Active Record, you can pass the relevant scope, field name, and query into the ```search``` method, like this:

    scope

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
