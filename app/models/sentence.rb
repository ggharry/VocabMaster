class Sentence < ActiveRecord::Base
  belongs_to :user
  has_many :user_words

  after_save :grab_used_words

  private

  def grab_used_words
    used_words = self.content.scan(/\w+/)

    user = self.user

    used_words.each do |word|
      matched_word = Word.find_by_name(word)

      if matched_word
        user.user_words.create(word: matched_word, sentence_id: self.id)
      end
    end
  end
end
