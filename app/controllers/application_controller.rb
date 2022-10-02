class ApplicationController < ActionController::Base

  before_action :set_cart

  private

  def set_cart
    @cart ||= Cart.find_or_create_by(identifier: session.id.to_s)
  end

end
