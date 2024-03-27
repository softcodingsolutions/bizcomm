module Api
  class UsersController < ApplicationController
    before_action :authenticate_devise_api_token!
    before_action :current_user

    def pending_requests
      @users = User.where(role: :vendor, approval_status: :pending)
    end
  end
end