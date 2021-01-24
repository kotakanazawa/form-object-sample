Rails.application.routes.draw do
  resources :user
  resources :user_registrations
  get '/hoges', to: 'hoges#index'
end
