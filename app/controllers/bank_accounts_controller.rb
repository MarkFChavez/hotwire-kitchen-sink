class BankAccountsController < ApplicationController

  def show
  end

  def withdraw
    @bank_account.withdraw(100)
  end

  def deposit
    @bank_account.deposit(100)
  end

  def toggle_lock
    @bank_account.toggle_lock
  end

  def reset_logs
    @bank_account.update(logs: nil)
  end

end
