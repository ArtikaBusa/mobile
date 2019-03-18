class SellerProductVariant < ApplicationRecord
  belongs_to :seller_product
  belongs_to :product_variant
  has_many :orders
end
