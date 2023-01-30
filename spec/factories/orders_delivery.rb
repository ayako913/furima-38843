FactoryBot.define do
  factory :order_delivery do
    postcode {'123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    cityaddress {'test'}
    address {'test'}
    buildingname {"test"}
    telphone {'0123456789'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
