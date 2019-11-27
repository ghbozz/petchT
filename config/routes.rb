Rails.application.routes.draw do
  devise_for :users

  get '/profile', to: 'dashboards#user_dashboard'

  get 'card_init', to: 'cards#init'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      post 'submit'
      post 'top'
    end
  end

  resources :cards, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      post 'submit'
    end
  end

  namespace :admin do
    get '/profile', to: 'dashboards#admin_dashboard'
    resources :articles, only: [:destroy] do
      post '/publish', to: 'articles#publish'
      post '/unpublish', to: 'articles#unpublish'
    end
    resources :cards, only: [:destroy] do
      post '/publish', to: 'cards#publish'
      post '/unpublish', to: 'cards#unpublish'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
end
