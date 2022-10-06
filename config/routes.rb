Rails.application.routes.draw do

  root "home#index"

  namespace :components do
    resource :shopping_cart, only: [:show]
    resource :user_review, only: [:show]
  end

  resource :shopping_cart, only: [:show, :create, :destroy]
  resources :user_reviews, only: [:index, :edit, :update, :create, :destroy]

end
