FactoryBot.define do
  factory :item do
    title { 'スニーカー' }
    description { '大昔に買いました' }
    category_id { 2 }
    product_state_id { 2 }
    delivery_charge_id { 2 }
    city_id { 33 }
    days_to_delivery_id { 2 }
    price { 50_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
