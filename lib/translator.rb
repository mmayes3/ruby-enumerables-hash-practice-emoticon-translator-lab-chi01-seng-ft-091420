require "yaml"
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  hnew = Hash.new
  library.each do |key, value|
    if !hnew.has_key? key
      hnew[key.to_s] = {}
    end
    if !hnew[key].has_key? 'english'
      hnew[key][:english] = value[0]
    end
    if !hnew[key].has_key? 'japanese'
      hnew[key][:japanese] = value[1]
    end
  end
  return hnew
end

def get_english_meaning(path, emot)
  hash = load_library(path)
  hash.each do |key, value|
   value.find_all do |vkey, sign|
     if sign == emot
       return key
     end
   end
 end
 return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emot)
  hash = load_library(path)
  hash.each do |key, value|
    if emot == value[:english]
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end


#puts  get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")
#puts  get_japanese_emoticon("./lib/emoticons.yml", ":)")
#puts load_library("./lib/emoticons.yml")
