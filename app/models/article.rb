class Article < ApplicationRecord
	belongs_to :user
	belongs_to :tag
	has_many :comments
  has_one_attached :picture
  has_many :likes
  has_many :favorites, foreign_key: "favorite_article"
  has_many :interested_users, through: :favorites, foreign_key: "favorite_article"

  # Method that checks if the request of index comes from the research bar or from the navbar

  def self.check_if_research(research)
  	if research[:content] == nil || research[:content] == ""
  		return false
		else
			return true
		end
	end

	# Method that uses the content of research input to collect any article that contains it either in
	# its title, content, tag or author email.

	def self.make_research(research)
		unless research[:content] == nil
			@articles = []
			@find_articles = Article.all
			@find_articles.each do |article|
				if article.tag.name.include? research[:content]
					@articles.append(article)
				elsif article.user.email.include? research[:content]
					@articles.append(article)
				elsif article.content.include? research[:content]
					@articles.append(article)
				elsif article.title.downcase.include? research[:content]
					@articles.append(article)
				end
			end
			return @articles.reverse
		end
	end

	# Verifies if the tag attached to the created article does exist and creates it if not
	
	def self.tag_exists?(tag)
		if Tag.find_by(name: tag) == nil
			Tag.create(name: tag)
		end
	end
	
end
