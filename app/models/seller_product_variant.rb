class SellerProductVariant < ApplicationRecord
  belongs_to :seller
  belongs_to :product_variant
  has_many :orders, dependent: :destroy
end
