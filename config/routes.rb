Rails.application.routes.draw do

  root 'static_pages#home'

  resources :articles
  devise_for :users
end


