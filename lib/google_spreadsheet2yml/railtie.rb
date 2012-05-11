require 'google_spreadsheet2yml'
require 'rails'

module GoogleSpreadsheet2yml
  class Railtie < Rails::Railtie
    railtie_name :google_spreadsheet2yml

    rake_tasks do
      load "tasks/google_spreadsheet2yml.rake"
    end
  end
end
