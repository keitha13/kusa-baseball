Rails.application.routes.draw do

  root "users/homes#top"

  get 'homes/top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

end
