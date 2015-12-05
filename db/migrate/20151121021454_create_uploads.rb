class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :song
      t.string :album
      t.string :artist
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :uploads, :song,                unique: false
  end
end
