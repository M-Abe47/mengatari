Rails.application.routes.draw do
  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }

  resources :users, only: [:show, :edit, :update] do
    resources :memos
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  root to: 'homes#top'
end
