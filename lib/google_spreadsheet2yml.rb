require "google_spreadsheet2yml/version"

module GoogleSpreadsheet2yml
  require 'google_spreadsheet2yml/railtie' if defined?(Rails)

  def self.hash_from_array(key, arr, main_hash)
    current_first = arr.delete_at(0)
    return { current_first => hash_from_array(key, arr, main_hash) } if arr.size > 0
    return { current_first => main_hash[key] }                       if arr.size == 0
  end

  def self.create_yaml(hash)
    @result = Hash.new
    merger = proc { |key,v1,v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
    hash.keys.each do |key|
      @result = @result.merge(hash_from_array(key, key.split('.'), hash), &merger)
    end
    @result.to_yaml
  end

end
