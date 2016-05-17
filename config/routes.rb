Rails.application.routes.draw do
  devise_for :users
  resources :characters

  root 'static_pages#home'
end
