module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      before_action :authenticate_user!
      before_action :set_api_v2_book, only: [:show]

      # GET /api/v2/books
      def index
        @api_v2_books = Book.all

        render_paginated @api_v2_books
      end

      # GET /api/v2/books/1
      def show
        render json: @api_v2_book
      end

      private

      def set_api_v2_book
        @api_v2_book = Book.find(params[:id])
      end
    end
  end
end
