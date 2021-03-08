FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'kkkkkkkkk66666' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太朗' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_date            { 19_520_101 }
  end
end
