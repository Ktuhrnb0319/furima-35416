FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'hironobu0319'}
    password_confirmation {password}
    first_name             {"鈴木"}
    last_name             {"一朗"}
    first_furigana             {"スズキ"}
    last_furigana             {"イチロウ"}
    birth_date             {'1994/03/19'}
  end
end