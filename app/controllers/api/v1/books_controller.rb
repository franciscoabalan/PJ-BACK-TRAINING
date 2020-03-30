module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      # GET /api/v1/books
      def index
        render_paginated Book.all
      end

      # GET /api/v1/books/1
      def show
        render json: book
      end

      private

      def book
        @book ||= Book.find(params[:id])
      end
    end
  end
end
