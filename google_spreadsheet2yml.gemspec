# -*- encoding: utf-8 -*-
require File.expand_path('../lib/google_spreadsheet2yml/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["luki3k5"]
  gem.email         = ["luki3k5@gmail.com"]
  gem.description   = %q{This gems allows simple management of translations from google spreadsheets - it converts google document into yml files}
  gem.summary       = %q{easy management of i18n-yml through google spreadsheets}
  gem.homepage      = ""
  gem.add_dependency "google-spreadsheet-ruby" 

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "google_spreadsheet2yml"
  gem.require_paths = ["lib"]
  gem.version       = GoogleSpreadsheet2yml::VERSION
end
