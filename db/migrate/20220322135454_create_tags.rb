class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :post
      t.string :nome
      t.timestamps null: false
    end
  end
end
