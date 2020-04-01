class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD
=======
  around_action :switch_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
>>>>>>> e4f74e3... Pundit added

  protected

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :unauthorized
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
