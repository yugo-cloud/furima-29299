FactoryBot.define do
  factory :user do
    nickname { "Taro" }
    email { Faker::Internet.free_email }
    password { "1111" }
    password_confirmation { password }
    family_name { "山田" }
    first_name { "太郎” }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birth_day { "2020-2-20" }
  end
end