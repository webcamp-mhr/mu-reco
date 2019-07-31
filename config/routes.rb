Rails.application.routes.draw do

root 'products#top'

devise_for :administrators
devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:show, :edit, :update, :index ]

resources :adderesses, only: [:create, :destroy, :update]

resources :products, only: [:show, :edit, :update, :index, :new, :create, :destroy]

resources :purchases_histories, only: [:show, :edit, :update, :index, :new, :create]

resources :carts, only: [:edit, :update, :index, :create, :destroy]

resources :discs, only: [:new, :create, :destroy]

resources :genres, only: [:new, :create, :destroy, :update]

resources :labels, only: [:new, :create, :destroy, :update]

resources :artists, only: [:new, :create, :destroy, :update]

resources :songs_titles, only: [:create, :destroy, :update, :new]

resources :purchases_products, only: [:create]

end
