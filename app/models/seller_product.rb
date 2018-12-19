class SellerProduct < ApplicationRecord
  belongs_to :seller
  belongs_to :product
end
