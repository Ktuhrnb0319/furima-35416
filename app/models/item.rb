class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :price, numericality: { with: /\A[0-9]*\z/, message: 'Half-width number' }
  end
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :product_state_id
    validates :delivery_charge_id
    validates :city_id
    validates :days_to_delivery_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :city
  belongs_to :days_to_delivery
  belongs_to :delivery_charge
  belongs_to :product_state
end
