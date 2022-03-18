class Post < ActiveRecord::Base
  has_many :post_users
  has_many :users, through: :post_users
  has_attached_file :foto
  validates_attachment :foto, presence: true
  validates_attachment_content_type :foto, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
