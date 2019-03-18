class Wishlist < ApplicationRecord
  validates :user_id, uniqueness: { scope: :product_id, message: 'This product already exists.' }

  belongs_to :user
  belongs_to :product
end
