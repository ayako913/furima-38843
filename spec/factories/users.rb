FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    firstname             {'山田'}
    lastname              {'太郎'}
    firstkana             {'ヤマダ'}
    lastkana              {'タロウ'}
    birthday              {Faker::Date.backward}
  end
end