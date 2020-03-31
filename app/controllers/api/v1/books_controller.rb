module Api
  module V1
    class BooksController < ApiController
      include Wor::Paginate

      # GET /api/v2/books
      def index
        render_paginated Book.all
      end

      # GET /api/v2/books/1
      def show
        render json: book
      rescue ActiveRecord::RecordNotFound => ex
        render json: { error: ex.message }, status: :not_found
      end

      private

      def book
        @book ||= Book.find(params[:id])
      end
    end
  end
end
