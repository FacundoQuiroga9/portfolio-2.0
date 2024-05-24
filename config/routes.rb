Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :projects, only: [] do
    collection do
      get 'react'
      get 'rails'
    end
  end

  namespace :admin do
    resources :projects, except: [:index, :show]
  end

  resources :technologies, only: [:index]

  root 'home#index'

  get 'profile_info', to: 'home#profile_info'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
