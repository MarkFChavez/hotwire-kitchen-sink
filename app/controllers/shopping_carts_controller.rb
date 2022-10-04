class ShoppingCartsController < ApplicationController

  def show
    @products = Product.all
  end

  def create
    @product = Product.find(params[:product_id])
    @cart.add(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @cart.remove(@product)
  end

end
