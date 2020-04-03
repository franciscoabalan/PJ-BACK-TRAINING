module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: exception.message }, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |exception|
        render json: { error: exception.message }, status: :unprocessable_entity
      end

      rescue_from ActionController::ParameterMissing do |exception|
        render json: { error: exception.message }, status: :bad_request
      end
    end
  end
end
