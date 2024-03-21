class ApplicationController < ActionController::API
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError do |exception|
    render json: { error: exception }, status: :unauthorized
  end

  private

  def current_user
    @current_user ||= User.find_by(id: current_devise_api_token[:resource_owner_id])
  end
end
