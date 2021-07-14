Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  root to: 'homes#top'
end
