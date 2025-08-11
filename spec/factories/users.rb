FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    first_name            { '健太朗' }
    family_name           { '後藤' }
    first_name_kana       { 'ケンタロウ' }
    family_name_kana      { 'ゴトウ' }
    date_of_birth         {Faker::Date.birthday(min_age: 4, max_age: 96)}
  end
end
