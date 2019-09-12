class Article < ApplicationRecord
	belongs_to :user
	belongs_to :tag
	has_many :comments
  has_one_attached :picture
  has_many :likes
  has_many :favorites, foreign_key: "favorite_article"
  has_many :interested_users, through: :favorites, foreign_key: "favorite_article"

end
