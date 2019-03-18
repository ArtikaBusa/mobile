class Order < ApplicationRecord
  belongs_to :seller, optional: true
  belongs_to :user
  belongs_to :seller_product_variant
  belongs_to :product_variant
end
