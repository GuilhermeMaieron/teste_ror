class CreatePostUsers < ActiveRecord::Migration
  def change
    create_table :post_users do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
