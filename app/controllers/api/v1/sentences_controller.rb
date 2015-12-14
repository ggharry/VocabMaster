module Api
  module V1
    class SentencesController < ApplicationController
      def index
        user = current_user

        @sentences = current_user.sentences.includes(:user_words)
      end

      def create
        user = current_user

        new_sentence = current_user.sentences.new(sentence_params)

        if new_sentence.save
          render json: { status: :success }, status: :created
        else
          render json: { status: :failed }, status: :bad_request
        end
      end

      private

      def sentence_params
        params.require(:sentence).permit(:content)
      end
    end
  end
end
