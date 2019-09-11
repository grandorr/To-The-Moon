# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
UserCrypto.destroy_all
User.destroy_all
CryptoCurrency.destroy_all
Tag.destroy_all

tags = ["#bitcoin", "#ethereum", "#litecoin", "#tether", "#monero"]
cryptos = ["bitcoin", "ethereum", "litecoin", "tether", "monero"]
emails = ["jon@mail.com", "jak@mail.com", "jim@mail.com", "jail@mail.com", "me@mail.com"]

n = 0
5.times do
	User.create(email: emails[n], 
		password: "monmdp", 
		password_confirmation: "monmdp"
		)
	n += 1
end

n = 0
5.times do
	Tag.create(name: tags[n])
	n += 1
end

users = User.all
cryptos = CryptoCurrency.all
tags = Tag.all

10.times do
	UserCrypto.create(
		user: users.sample, 
		crypto_currency: cryptos.sample, 
		quantity: rand(1..25)
		) 
end

10.times do
	Article.create(
		user: users.sample, 
		tag: tags.sample, 
		title: Faker::Science.element,
		content: Faker::Movies::Lebowski.quote
		)
end