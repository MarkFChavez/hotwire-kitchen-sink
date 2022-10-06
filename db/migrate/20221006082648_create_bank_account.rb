class CreateBankAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.column :identifier, :string, null: false
      t.column :balance, :decimal, default: 0, unsigned: true, null: false
      t.column :locked, :boolean, default: false

      t.timestamps
    end

    add_index :bank_accounts, :identifier, unique: true
  end
end
