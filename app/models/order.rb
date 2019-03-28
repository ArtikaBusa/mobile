class Order < ApplicationRecord
  validates :address, :city, :state, :pincode, presence: true
  belongs_to :seller
  belongs_to :user
  belongs_to :seller_product_variant
  belongs_to :product_variant
end
