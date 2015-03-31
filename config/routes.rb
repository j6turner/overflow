Rails.application.routes.draw do
  devise_for :users
  root :to => 'questions#index'

  resources :users do
    resources :questions do
      resources :responses, :except => [:index, :new]
    end
  end
  
  resources :questions do
    resources :responses, :except => [:index, :new]
  end

  get "/log-in" => "sessions#new", as: :log_in
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

 end
