Rails.application.routes.draw do
  resources :business_categories
  namespace :api do
    devise_for :users

    resources :users do
      get 'pending_requests' , to: 'users#pending_requests', on: :collection
      get 'registered_users', to: 'users#registered_users', on: :collection
      member do
        post 'approve_request', to: 'users#approve_request'
        post 'reject_request', to: 'users#reject_request'
      end
    end
    resources :packages
    resources :business_categories
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
