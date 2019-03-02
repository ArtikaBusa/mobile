class SellerProductVariant < ApplicationRecord
  belongs_to :seller_product
  belongs_to :product_variant
end
