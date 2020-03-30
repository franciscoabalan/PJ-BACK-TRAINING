module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      # GET /api/v1/:user_id/rents
      def index
        render_paginated rents
      end

      # POST /api/v1/rents
      def create
        rent = Rent.create!(rent_params)
        render json: rent
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      def rents
        @rents ||= User.find(params[:user_id]).rents
      end

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_rent, :end_rent)
      end
    end
  end
end
