module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      # GET /api/v1/:user_id/rents
      def index
        authorize rents
        render_paginated rents
      end

      # POST /api/v1/rents
      def create
        rent = Rent.create!(rent_params)
        authorize rent
        render json: rent, status: :created
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
