FactoryBot.define do
  factory :item do
    title              { 'test' }
    text               { Faker::Lorem.sentence }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    state_id           { Faker::Number.between(from: 2, to: 7) }
    charge_id          { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    severalday_id      { Faker::Number.between(from: 2, to: 3) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
