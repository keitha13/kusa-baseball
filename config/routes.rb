Rails.application.routes.draw do

  root "users/homes#top"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
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
      resources :post_comments, only: [:create, :destroy]
    end
  end

end
