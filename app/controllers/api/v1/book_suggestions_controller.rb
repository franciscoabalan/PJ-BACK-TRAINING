module Api
  module V1
    class BookSuggestionsController < ApiController
      before_action :authenticate_user!, except: [:create]

      # POST /api/v1/book_suggestion
      def create
        book_suggestion = BookSuggestion.new(rent_params)
        book_suggestion.user = current_user if current_user.present?

        authorize book_suggestion
        book_suggestion.save!
        render json: book_suggestion, status: :created
      end

      private

      def rent_params
        params.require(:book_suggestion).permit(:synopsis,
                                                :price,
                                                :author,
                                                :title,
                                                :link,
                                                :publisher,
                                                :year)
      end
    end
  end
end
