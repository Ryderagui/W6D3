Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show, :index, :create, :destroy, :update]

  resources :artworks, only: [:show, :create, :destroy, :update]

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:index, :create, :destroy]

  resources :likes, only: [:index, :create, :destroy]

  # resources :users do
  #   resources :artworks, only: :index
  # end

  get 'users/:user_id/artworks', to: 'artworks#index'

  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users$#update'

end
