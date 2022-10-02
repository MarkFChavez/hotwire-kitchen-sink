class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :identifier, null: false

      t.timestamps
    end

    add_index :carts, :identifier, unique: true
  end
end
