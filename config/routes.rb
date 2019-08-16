Rails.application.routes.draw do

root 'products#top'

devise_for :administrators
devise_for :users, controllers: { registrations: 'users/registrations' }
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
match 'carts/all' => 'carts#update_all', :as => :update_all, :via => :put

resources :users, only: [:show, :edit, :update, :index, :destroy ]

resources :adderesses, only: [:create, :destroy, :update]

resources :products, only: [:show, :edit, :update, :index, :new, :create, :destroy]

resources :purchase_histories, only: [:show, :edit, :update, :index, :new, :create]

resources :carts, only: [:edit, :update, :index, :create, :destroy]

resources :discs, only: [:new, :create, :destroy]

resources :genres, only: [:new, :create, :destroy, :update]

resources :labels, only: [:new, :create, :destroy, :update]

resources :artists, only: [:new, :create, :destroy, :update]

resources :songs_titles, only: [:create, :destroy, :update, :new]

resources :purchase_products, only: [:create]

# delete '/carts' => 'carts#destroy_all'


end


