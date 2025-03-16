FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    rating { Faker::Number.between(from: 1, to: 5) }
    comment { Faker::Lorem.paragraph }
    bookcase { FactoryBot.create(:bookcase, user: FactoryBot.create(:user)) }
  end
end
