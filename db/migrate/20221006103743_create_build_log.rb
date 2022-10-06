class CreateBuildLog < ActiveRecord::Migration[7.0]
  def change
    create_table :build_logs do |t|
      t.column :identifier, :string, null: false
      t.column :body, :text

      t.timestamps
    end

    add_index :build_logs, :identifier, unique: true
  end
end
