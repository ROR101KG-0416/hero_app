Rails.application.routes.draw do
  devise_for :users
  resources :characters do 
    resources :comments, only: [:create]
  end
  

  root 'static_pages#home'
end
