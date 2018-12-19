class Seller < ApplicationRecord
  has_many :order
  has_many :seller_product_variants, dependent: :delete_all
  has_many :seller_products, dependent: :delete_all
  has_many :product_variants, through: :seller_product_variants
  has_many :products, through: :seller_products
end
