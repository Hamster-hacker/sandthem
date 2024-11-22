Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: "dreams#index"
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get "home", to: "pages#home"
  get "index", to: "dreams#index"


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

  get 'profile', to: 'pages#profile', as: 'profile'

  resources :dreams do
    collection do
      get 'my_dreams', to: 'dreams#user_dreams', as: 'user'
    end

    resources :bookings, only: %i[new create]

    resources :reviews, only: %i[new create edit update destroy]
  end
end
