class Article < ApplicationRecord
	belongs_to :user
	belongs_to :tag
	has_many :comments
  has_one_attached :picture
  has_many :likes

end
