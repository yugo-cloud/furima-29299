FactoryBot.define do
  factory :order do
    association :user
    association :item
    post_code { "123-1234" }
    prefecture_id { "1" }
    city { "大阪市中央区" }
    address { "青山1-1-1" }
    building_name { "スカイツリー102号室" }
    phone_number { "09012345678" }
    token { "ppapjp" }
  end
end