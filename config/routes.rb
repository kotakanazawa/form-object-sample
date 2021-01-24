Rails.application.routes.draw do
  root "hoges#index"
  resources :user_registrations
  resources :hoges, only: %i[index]
end
