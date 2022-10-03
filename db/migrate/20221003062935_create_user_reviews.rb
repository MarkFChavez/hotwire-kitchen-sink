class CreateUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reviews do |t|
      t.string :author, null: false
      t.text :content, null: false
      t.integer :rating, null: false, unsigned: true

      t.timestamps
    end
  end
end
