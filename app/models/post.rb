class Post < ActiveRecord::Base
  has_many :post_users
  has_many :tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['nome'].blank?}
  has_many :users, through: :post_users
  has_attached_file :foto
  validates_attachment :foto, presence: true
  validates_attachment_content_type :foto, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
