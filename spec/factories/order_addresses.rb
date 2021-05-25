FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    prefecture { 10 }
    city { '東京都' }
    address_number { '1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011101110' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { "" }
    item_id { "" }
  end
end
