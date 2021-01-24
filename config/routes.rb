Rails.application.routes.draw do
  resources :user_registrations
  resources :hoges, only: %i[index]
end
