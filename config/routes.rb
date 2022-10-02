Rails.application.routes.draw do

  root "home#index"

  namespace :shopping_cart do
    resource :use, only: %i[show]
    resource :apply, only: %i[show] do
      post :add
      delete :remove
    end
  end

end
