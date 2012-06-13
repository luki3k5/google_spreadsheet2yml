namespace :gs2yml do 

  desc "gets translations from google doc and creates YML files"
  task :translate do
    puts "Starting Translation"

    require "google_spreadsheet"
    require 'yaml'
    require 'google_spreadsheet2yml'
    config = ""

    begin 
      puts "Loading configuration..."
      config = YAML.load_file("./config/google_doc_translations_config.yml")
    rescue Exception => ex 
      puts("config file missing!")
      exit
    end

    login           = config['google_user_id']                # Getting the login information
    password        = config['google_password']               # getting password information
    spreedsheet_key = config['google_spreedsheet_to_process'] # getting spreedsheet id

    session = GoogleSpreadsheet.login(login, password)
    puts "connected..."
    spreadsheet = session.spreadsheet_by_key(spreedsheet_key)
    puts "got spreadsheet..."
    ws = spreadsheet.worksheets[0] # getting the first worksheet 
    puts "got worksheet..."
    languages = {}

    puts "Parsing Google Docs"

    (3..ws.num_cols).each do |c|
      languages["#{ws[1,c]}"] = c
    end 

    # Create flat HASH from Spreedsheet that will be processed 
    languages.keys.each do |lang| 
      hash = Hash.new
      (2..ws.num_rows).each do |row|
        if !ws[row, 1].blank? && !ws[row, languages[lang]].blank? && !ws[row, languages[lang]] == "missing"         
          hash.store([lang, ws[row, 1].strip.rstrip].join('.'), ws[row, languages[lang]].strip.rstrip)
        elsif !ws[row, 1].blank?
          hash.store([lang, ws[row, 1].strip.rstrip].join('.'), ws[row, languages["en"]].strip.rstrip)
        end
      end

      puts "Writting file to: #{lang}.gdoc.yml"
      File.open("./config/locales/#{lang}.gdocs.yml", 'w') {|f| f.write(GoogleSpreadsheet2yml.create_yaml(hash)) }
    end
  end
end
