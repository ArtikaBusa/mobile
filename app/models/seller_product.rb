class SellerProduct < ApplicationRecord
  validates :seller_id, uniqueness: { scope: :product_id, message: 'This product already exists.' }

  belongs_to :seller
  belongs_to :product

  has_many :seller_product_variants, inverse_of: :seller_product, dependent: :destroy
  accepts_nested_attributes_for :seller_product_variants, allow_destroy: true, reject_if: :all_blank
end
