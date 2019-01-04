class Seller < ApplicationRecord
  validates :name, :address, :contact_no, presence: true
  validates :email, uniqueness: true
  validates :contact_no, numericality: true, length: { maximum: 15 }, uniqueness: true
  has_many :order
  has_many :seller_product_variants, dependent: :delete_all
  has_many :seller_products, dependent: :delete_all
  has_many :product_variants, through: :seller_product_variants
  has_many :products, through: :seller_products
end
