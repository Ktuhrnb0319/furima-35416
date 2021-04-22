class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: 'Select'}
  validates :product_state_id, numericality: { other_than: 1 ,message: 'Select' }
  validates :delivery_charge_id, numericality: { other_than: 1 ,message: 'Select' }
  validates :city_id, numericality: { other_than: 1 ,message: 'Select' }
  validates :days_to_delivery_id, numericality: { other_than: 1 ,message: 'Select' }
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :city
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_delivery
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_state

end