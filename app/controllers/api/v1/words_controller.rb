module Api
  module V1
    class WordsController < ApplicationController
      def index
        words = Word.all

        render json: words
      end

      def three_new_words
        user = current_user

        mastered_words_ids = user.user_words.pluck(:word_id)

        possible_words = Word.where.not(id: mastered_words_ids)

        render json: possible_words.shuffle.first(3)
      end
    end
  end
end
