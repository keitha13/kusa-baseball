Rails.application.routes.draw do

  root "users/homes#top"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  get 'homes/top'

  scope module: :users do
    resources :users, only: [:index, :show, :edit, :update] do
      collection do
        get "quit"
        put "out"
      end
    end

    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :follow_relationships, only: [:create, :destroy]
    resources :rooms, only: [:index, :show, :create, :destroy]
  end

end
