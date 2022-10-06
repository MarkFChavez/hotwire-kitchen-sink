class BankAccount < ApplicationRecord

  before_create :load_free_bal

  validates :identifier, presence: true, uniqueness: true
  validates :balance, presence: true

  FREE_BALANCE = 2_000.freeze
  NO_LOG = "No logs for your bank account.".freeze

  def withdraw(amount)
    if locked?
      new_log = logs.to_s + "[#{Time.current.to_s}] Attempted to withdraw #{amount} but account is locked. \n"
      update(logs: new_log)
      return
    end

    with_lock do
      new_bal = (balance - amount)
      return if new_bal < 0

      if update(balance: new_bal)
        new_log = logs.to_s + "[#{Time.current.to_s}] Withdrew #{amount} successfully. \n"
        update(logs: new_log)
      end
    end
  end

  def deposit(amount)
    if locked?
      new_log = logs.to_s + "[#{Time.current.to_s}] Attempted to deposit #{amount} but account is locked. \n"
      update(logs: new_log)
      return
    end

    with_lock do
      new_bal = balance + amount

      if update(balance: new_bal)
        new_log = logs.to_s + "[#{Time.current.to_s}] Deposited #{amount} successfully. \n"
        update(logs: new_log)
      end
    end
  end

  def toggle_lock
    update(locked: !locked)
  end

  private

  def load_free_bal
    self.balance = FREE_BALANCE
  end

end
