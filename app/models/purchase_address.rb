class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :city_id, :town, :street, :building, :telephone_number, :item_id, :user_id
  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
  validates :town
  validates :street
  validates :telephone_number#, format: {with: [0-9]{,11}, message: "Input only number"}
end
validates :city_id, numericality: {other_than: 0, message: "Select"}

def save
  # 寄付情報を保存し、変数donationに代入する
  purchase = Purchase.create(item_id: item_id, user_id: user_id)
  # 住所を保存する
  # donation_idには、変数donationのidと指定する
  Address.create(postal_code: postal_code, city_id: city_id, town: town, street: street, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
end

end
