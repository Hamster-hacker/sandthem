Rails.application.routes.draw do
  devise_for :users
  root to: "dreams#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # Users routes
  resources :users, only: [:show] do
    collection do
      post :register
      post :login
    end

    member do
      post :update
      get :dreams, to: 'dreams#userDreams'
      get :bookings, to: 'bookings#index'
    end
  end

  # Dreams routes
  #
  resources :dreams
  get 'my_dreams', to: 'dreams#user_dreams', as: 'user_dreams'

  # resources :dreams do


  #   member do
  #     get :edit
  #     delete :delete, action: :destroy
  #   end

  #   resources :bookings, only: [:new, :create, :index], module: :dreams
  # end

  # Bookings routes
  resources :bookings, only: [:show]
end
