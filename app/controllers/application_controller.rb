class ApplicationController < ActionController::Base

  before_action :set_cart
  before_action :set_bank_account

  private

  def set_cart
    @cart ||= Cart.find_or_create_by(identifier: session.id.to_s)
  end

  def set_bank_account
    @bank_account ||= BankAccount.find_or_create_by(identifier: session.id.to_s)
  end

end
