class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.integer :likes
      t.timestamps null: false
    end
  end
end
