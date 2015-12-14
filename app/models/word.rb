class Word < ActiveRecord::Base
  has_many :user_words
end
