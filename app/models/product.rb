class Product < ApplicationRecord
  belongs_to :brand
  has_many :product_variants
  has_many :product_categories, dependent: :delete_all
  has_many :Categories, through: :product_categories
  has_many :seller_products, dependent: :delete_all
  has_many :sellers, through: :seller_products
  has_many_attached :mobile_photos
end
