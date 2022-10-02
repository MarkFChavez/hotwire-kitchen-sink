class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.decimal :price, unsigned: true, null: false

      t.timestamps
    end
  end
end
