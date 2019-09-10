class Article < ApplicationRecord
	belongs_to :user
	belongs_to :tag
	has_many :comments
end
