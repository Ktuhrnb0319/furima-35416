class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :product_state_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :city_id, numericality: { other_than: 1 }
  validates :days_to_delivery_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :city
  belongs_to :days_to_delivery
  belongs_to :delivery_charge
  belongs_to :product_state

end

