json.array! @sentences do |sentence|
  json.content sentence.content
  json.words_used Word.where(id: sentence.user_words.pluck(:word_id))
end
