# GoogleSpreadsheet2yml

This is a little gem that allows for easy management of Google
Spreadsheets translations - it converts each column to corresponding
language taking the first row for each column as tha name of the 
translation/locale. (i.e. en.gdoc.yml de.gdoc.yml pl.gdoc.yml)

## Installation

Add this line to your application's Gemfile:

    gem 'google_spreadsheet2yml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_spreadsheet2yml

## Usage

Insert 'google_doc_translations_config.yml' file into 'config' directory 
of your Rails application - below is a content it should have:  

    google_user_id: user
    google_password: password
    google_spreedsheet_to_process: 'xxxxxxxxxxxxxxxx'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
