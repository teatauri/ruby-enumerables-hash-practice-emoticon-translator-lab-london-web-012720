require "yaml"
require "pp"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  final = {
    'get_meaning'  => {},
    'get_emoticon' => {}
  }
  emoticons.each do |meaning, symbols|
    final['get_meaning'][symbols[1]] = meaning
    final['get_emoticon'][symbols[0]] = symbols[1]
  end
  final
end

def get_japanese_emoticon(file_path, english_emo)
  emoticons = load_library(file_path)
  japan_emo = emoticons['get_emoticon'][english_emo]
  japan_emo ? japan_emo : 'Sorry, that emoticon was not found'
end

def get_english_meaning(file_path, japan_emo)
   emoticons = load_library(file_path)
   eng_meaning = emoticons['get_meaning'][japan_emo]
   eng_meaning ? eng_meaning : 'Sorry, that emoticon was not found'
end