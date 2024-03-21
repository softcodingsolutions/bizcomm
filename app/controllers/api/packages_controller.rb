module Api
  class PackagesController < ApplicationController
    before_action :authenticate_devise_api_token!
    before_action :current_user
    def index
      packages = Package.all
      render json: { packages:, message: 'Here is the list of packages' }, status: :ok
    end

    def create
      package = Package.new(package_params)
      package.user = current_devise_api_user
      authorize package
      if package.save
        render json: { package:, message: 'Package has been created successfully' }, status: :created
      else
        render json: { error: package.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @package.update(package_params)
        render json: { package: @package, message: 'Package has been created successfully' }, status: :ok
      else
        render json: { error: @package.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      if @package.destroy
        render json: { package: @package, message: 'Package has been updated successfully' }, status: :ok
      end
    end

    private

    def package_params
      params.require(:package).permit(:name, :price, :description)
    end
  end
end
