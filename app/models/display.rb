class Display < ApplicationRecord
  has_many :product_variants, dependent: :destroy
end
