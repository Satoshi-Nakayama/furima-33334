FactoryBot.define do
  factory :item do
    association :user
    item_name             { '商品' }
    item_info             { '説明' }
    item_price            { 10000 }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_fee_id       { 2 }
    prefecture_id         { 2 }
    duration_id           { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
