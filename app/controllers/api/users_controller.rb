module Api
  class UsersController < ApplicationController
    before_action :authenticate_devise_api_token!
    before_action :current_user

    def pending_requests
      @users = User.where(role: :vendor, approval_status: :pending)
      authorize current_user
      render json: {users: @users, message: "Pending requests rendered successfully"}, status: :ok
    end

    def approve_request
      @user = User.find_by(id: params[:id])
      authorize current_user
      if @user.nil?
        render json: {error: "User not found"}, status: :not_found
        return
      end
      if @user.approved? || @user.rejected?
        render json: {error: "User request has already been approved or rejected."}, status: :unprocessable_entity
        return
      end
      if @user.update(approval_status: :approved)
        render json: {user: @user, message: "User approved successfully"}, status: :ok
      else
        render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def reject_request
      @user = User.find_by(id: params[:id])
      authorize current_user
      if @user.nil?
        render json: {error: "User not found"}, status: :not_found
        return
      end
      if @user.approved? || @user.rejected?
        render json: {error: "User request has already been approved or rejected."}, status: :unprocessable_entity
        return
      end
      if @user.update(approval_status: :rejected)
        render json: {user: @user, message: "User rejected successfully"}, status: :ok
      else
        render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def registered_users
      @users = User.where(approval_status: "approved")
      authorize current_user
      render json: {users: @users, message: "Registered users rendered successfully"}, status: :ok
    end
  end
end