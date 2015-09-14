require 'sidekiq/web'

Rails.application.routes.draw do
  
  root to: "landings#index"

  resource :account, only: :show

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: :get
  
  match 'api/widget/:widget', to: "api#widget", via: :get
  match '/api/reviews/:widget', to: "api#reviews", via: :get

  get "sign_in" => "account/authentications#sign_in"
  get "sign_up" => "account/authentications#sign_up"
  get "sign_out" => "account/authentications#sign_out"
  get "change_password/:token" => "account/authentications#change_password"
  post "change_password" => "account/authentications#save_password"
  get "confirm_email" => "account/authentications#confirm_email"
  post "signin" => "account/authentications#signin"
  post "signup" => "account/authentications#signup"
  post "signup_short" => "account/authentications#signup_short"

  namespace :account do

    root to: 'account#show'

    resources :authentications do 
      get :sign_in, on: :collection
      get :sign_up, on: :collection

      get :change_password, on: :collection
      put :save_password, on: :collection

      get :confirm_email, on: :collection

      post :signin, on: :collection
      post :signup, on: :collection
      post :signup_short, on: :collection
      get :sign_out, on: :collection
    end
    resources :reviews
    resource :widget, only: [:show, :update]
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      put :resend_invite, on: :member
    end
    resource :profile, only: [:show, :update] do
      put :send_email_confirmation, on: :member
      put :send_new_password, on: :member
    end

    resource :email_template, only: [:show, :update]
    resources :offers, only: [:index, :show, :create, :destroy]
    resources :mass_offer_tasks, only: [:index, :show, :create]

  end

  resources :sessions, only: [:new, :create]

  resource :board, only: :show do
    get :login, on: :collection
    get :logout, on: :collection
    get :widget_not_found, on: :collection
  end

  match '/board/:widget', to: "boards#show", via: :get


  resource :review, only: [:show, :create, :update]
  resource :widget, only: [:show]
  resources :api, only: [:index] do
    get :reviews, on: :collection
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    mount Sidekiq::Web => '/sidekiq'
  end

end
