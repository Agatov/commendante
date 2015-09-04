Rails.application.routes.draw do
  root to: "landings#index"

  resource :account, only: :show

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get "/sites/:site_url", to: "reviews#index", :constraints => { :site_url => /[^\/]+/ }

  namespace :account do
    resources :authentications
    resources :reviews
    resource :widget, only: [:show, :update]
  end

  resources :sessions, only: [:new, :create]
  resources :reviews, only: [:index, :new, :create]
  resource :widget, only: [:show]
  resources :api, only: [:index] do
    get :reviews, on: :collection
  end

end
