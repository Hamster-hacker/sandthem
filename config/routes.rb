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
  resources :dreams do
    collection do
      get 'my_dreams', to: 'dreams#user_dreams', as: 'user'
    end

    resources :bookings, only: %i[new create]

    # Nested reviews routes
    resources :reviews, only: [:new, :create]
  end

  # Bookings routes
end
