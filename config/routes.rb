Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { invitations: 'admin/invitations' }

  post '/newsletter', to: 'pages#home'
  get '/profile', to: 'dashboards#user_dashboard'

  get 'card_init', to: 'cards#init'
  get 'animal_select', to: 'articles#animal_select'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy], path: 'conseils' do
    member do
      post 'submit'
      post 'top'
    end
  end

  resources :cards, only: [:index, :show, :new, :create, :edit, :update], path: 'fiches' do
    member do
      post 'submit'
    end
  end

  resources :brands, only: [:index, :show], path: 'marques'

  namespace :admin do

    get '/profile', to: 'dashboards#admin_dashboard'

    # get '/invite', to: 'invitations#new'
    # post '/invite', to: 'invitations#create'

    resources :articles, only: [:destroy] do
      post '/publish', to: 'articles#publish'
      post '/unpublish', to: 'articles#unpublish'
    end

    resources :cards, only: [:destroy] do
      post '/publish', to: 'cards#publish'
      post '/unpublish', to: 'cards#unpublish'
    end

    resources :brands, only: [:new, :create, :edit, :update, :destroy] do
      resources :products, only: [:create]
    end

    resources :products, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
