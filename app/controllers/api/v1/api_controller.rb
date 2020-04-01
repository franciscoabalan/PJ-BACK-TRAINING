module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: exception.message }, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |exception|
        render json: { error: exception.message }, status: :not_found
      end
    end
  end
end
