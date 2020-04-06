module Api
  module V1
    class OpenLibrariesController < ApiController
      skip_before_action :authenticate_user!

      def book
        isbn = params[:isbn]
        book_service = OpenLibrary::BookService.new
        book = book_service.find(isbn)

        if book.present?
          render json: book
        else
          render json: { error: "Book #{isbn}, Not found" }, status: :not_found
        end
      end
    end
  end
end
