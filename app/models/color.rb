class Color < ApplicationRecord
  attr_accessor :products_attributes
  validates :name, presence: true, uniqueness: true
  has_many :product_variants, dependent: :destroy
end
