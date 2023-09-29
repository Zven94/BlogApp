Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:index, :new, :create, :show] 
      resources :likes, only: [:create, :destroy]
    end
  end
  # Defines the root path route ("/")
end
