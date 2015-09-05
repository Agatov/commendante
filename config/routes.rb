Rails.application.routes.draw do
  root to: "landings#index"

  resource :account, only: :show

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/board/:widget', to: "boards#show", via: :get

  get "/sites/:site_url", to: "reviews#index", :constraints => { :site_url => /[^\/]+/ }

  get "sign_in" => "account/authentications#sign_in"
  get "sign_up" => "account/authentications#sign_up"
  get "sign_out" => "account/authentications#sign_out"
  post "signin" => "account/authentications#signin"
  post "signup" => "account/authentications#signup"

  namespace :account do

    root to: 'account#show'

    resources :authentications do 
      get :sign_in, on: :collection
      get :sign_up, on: :collection

      get :change_password, on: :collection

      post :signin, on: :collection
      post :signup, on: :collection
      get :sign_out, on: :collection
    end
    resources :reviews
    resource :widget, only: [:show, :update]
  end

  resources :sessions, only: [:new, :create]
  resource :board, only: :show do
    get :login, on: :collection
    get :logout, on: :collection
    get :widget_not_found, on: :collection
  end
  resource :review, only: [:show, :create, :update]
  resource :widget, only: [:show]
  resources :api, only: [:index] do
    get :reviews, on: :collection
  end

end
