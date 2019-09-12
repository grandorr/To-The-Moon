FactoryBot.define do
  factory :tag do
    name { Faker::Currency.code }
  end
end