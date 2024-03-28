module Api
  class PackagesController < ApplicationController
    before_action :authenticate_devise_api_token!
    before_action :current_user
    before_action :set_package, only: [:update, :destroy]
    def index
      packages = Package.all
      render json: { packages:, message: 'Here is the list of packages' }, status: :ok
    end

    def create
      package = Package.new(package_params)
      authorize package
      if package.save
        render json: { package:, message: 'Package has been created successfully' }, status: :created
      else
        render json: { error: package.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      authorize @package
      if @package
        if @package.update(package_params)
          render json: { package: @package, message: 'Package has been created successfully' }, status: :ok
        else
          render json: { error: @package.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: {error: "Package was not found"}, status: :not_found
      end
    end

    def destroy
      authorize @package
      if @package
        @package.destroy
        render json: { package: @package, message: 'Package has been deleted successfully' }, status: :ok
      end
    end

    private

    def package_params
      params.require(:package).permit(:name, :price, package_details: {details: []})
    end

    def set_package
      @package = Package.find_by(id: params[:id])
    end
  end
end
