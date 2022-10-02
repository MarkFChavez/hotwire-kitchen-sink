module ShoppingCart
  class AppliesController < ApplicationController

    def show
      @products = Product.all
    end

    def add
      @product = Product.find(params[:product_id])
      @cart.add(@product)
    end

    def remove
      @product = Product.find(params[:product_id])
      @cart.remove(@product)
    end

  end
end
