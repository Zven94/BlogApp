Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :udpdate, :show] do
    resources :posts, only: [:index, :new, :show] do
      resources :comments, only: [:index, :new, :show] 
      resources :likes, only: [:index, :update]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
