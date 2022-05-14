FactoryBot.define do
  factory :user do
    nickname              {'sd'}
    email                 {Faker::Internet.free_email}
    password              {'1234abcd'}
    password_confirmation {password}
    first_name            {'紅'}
    last_name             {'蒼'}
    first_name_kana       {'アカ'}
    last_name_kana        {'アオ'}
    birthday              {'20010101'}
  end
end