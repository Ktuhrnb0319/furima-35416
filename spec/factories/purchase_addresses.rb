FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    city_id { 2 }
    town { '江戸川区' }
    street { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '08022622789' }
  end
end
