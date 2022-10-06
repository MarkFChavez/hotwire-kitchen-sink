class AddLogsToBankAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :bank_accounts, :logs, :text
  end
end
