class ProductVariant < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :storage, optional: true
  belongs_to :color, optional: true
  belongs_to :display, optional: true
  belongs_to :processor, optional: true
  has_many :seller_product_variants, dependent: :delete_all
  has_many :seller, through: :seller_product_variants
  has_many :orders
end
