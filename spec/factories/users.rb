FactoryBot.define do
	mdp = Faker::Internet.password(min_length: 6)
  factory :user do
    email { Faker::Internet.email }
    password { mdp }
    password_confirmation { mdp }    
  end
end