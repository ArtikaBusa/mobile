class Processor < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :product_variants, dependent: :destroy
end
