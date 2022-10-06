Rails.application.routes.draw do

  root "home#index"

  namespace :components do
    resource :shopping_cart, only: [:show]
    resource :user_review, only: [:show]
    resource :bank_account, only: [:show]
  end

  resource :shopping_cart, only: [:show, :create, :destroy]
  resources :user_reviews, only: [:index, :edit, :update, :create, :destroy]
  resource :bank_account, only: [:show] do
    patch :withdraw
    patch :deposit
    patch :toggle_lock
    patch :reset_logs
  end

end
