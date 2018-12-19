class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :storage
  belongs_to :color
  belongs_to :display
  belongs_to :processor
  has_many :seller_product_variants, dependent: :delete_all
  has_many :seller, through: :seller_product_variants
  has_many :orders
end
