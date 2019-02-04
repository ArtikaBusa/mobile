class Storage < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :product_variants, dependent: :destroy
  has_many :products, through: :product_variants
end
