class Api::BusinessCategoriesController < ApplicationController
  before_action :authenticate_devise_api_token!
  before_action :current_user
  def index
    business_categories = BusinessCategory.all
    render json: { business_categories:, message: 'Here is the list of business_categories' }, status: :ok
  end

  def create
    business_category = BusinessCategory.new(business_category_params)
    authorize business_category
    if business_category.save
      render json: { business_category:, message: 'business_category has been created successfully' }, status: :created
    else
      render json: { error: business_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @business_category.update(business_category_params)
      render json: { business_category: @business_category, message: 'business_category has been created successfully' }, status: :ok
    else
      render json: { error: @business_category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @business_category.destroy
      render json: { business_category: @business_category, message: 'business_category has been updated successfully' }, status: :ok
    end
  end

  private

  def business_category_params
    params.require(:business_category).permit(:name, :price, :description)
  end
end
