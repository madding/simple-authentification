Rails.application.routes.draw do
  resources :users
  resources :user_sessions, only: %i[new create destroy]

  root 'hello#index'
end
