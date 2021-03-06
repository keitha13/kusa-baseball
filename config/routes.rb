Rails.application.routes.draw do
  root "users/homes#top"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  get 'homes/top'

  scope module: :users do
    resources :users, only: [:show, :edit, :update] do
      collection do
        get "quit"
        put "out"
        get "search"
      end
      member do
        get "followings"
        get "followers"
      end
    end

    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :follow_relationships, only: [:create, :destroy] do

    end
    resources :rooms, only: [:index, :show, :create, :destroy]
  end

  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
end
