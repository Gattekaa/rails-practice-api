FactoryBot.define do
  factory :bookcase do
    limit { Faker::Number.between(from: 1, to: 10) }
    user { FactoryBot.create(:user) }
  end
end
