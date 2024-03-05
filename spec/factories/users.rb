FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name{"太郎"}
    first_name{"山田"}
    last_name_kana{"タロウ"}
    first_name_kana{"ヤマダ"}
    birthday {"1930-01-01"}
  end
end
