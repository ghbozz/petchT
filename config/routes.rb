Rails.application.routes.draw do
  devise_for :users

  get '/profile', to: 'dashboards#user_dashboard'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      post 'submit'
    end
  end

  resources :cards, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do
    get '/profile', to: 'dashboards#admin_dashboard'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
end
