class AddFotoToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :foto
  end
end
