Rails.application.routes.draw do
  devise_for :administrators
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:show, :edit, :update, :index, :destroy]

resources :adderesses, only: [:create, :destroy, :update]

resources :products, only: [:show, :edit, :update, :index, :new, :create]

resources :purchases_histories, only: [:show, :edit, :update, :index, :new, :create]

resources :carts, only: [:edit, :update, :index, :create, :destroy]

resources :discs, only: [:create, :destroy]

resources :genres, only: [:create, :destroy, :update]

resources :labels, only: [:create, :destroy, :update]

resources :artists, only: [:create, :destroy, :update]

resources :songs_titles, only: [:create, :destroy, :update, :new]

resources :purchases_products, only: [:create]

end
