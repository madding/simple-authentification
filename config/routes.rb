Rails.application.routes.draw do
  resources :users
  resources :user_sessions, only: %i[new create] do
    delete :destroy, on: :collection
  end

  root 'hello#index'
end
