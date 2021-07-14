Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  root to: 'homes#top'
end
