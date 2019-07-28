class Product < ApplicationRecord
  belongs_to :brand

  scope :cheap_products, -> { where(price: 0..50.0).order(price: :asc)}
  scope :expensive_products, -> { where(price: 50.01..Float::INFINITY).order(price: :asc)}
end
