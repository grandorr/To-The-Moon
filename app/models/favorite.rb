class Favorite < ApplicationRecord
	belongs_to :interested_user, class_name: "User", optional: true
	belongs_to :favorite_article, class_name: "Article", optional: true
end
