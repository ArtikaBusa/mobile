class Product < ApplicationRecord
  belongs_to :brand
  has_many :product_variants
  has_many :colors, through: :product_variants
  has_many :displays, through: :product_variants
  has_many :processors, through: :product_variants
  has_many :storages, through: :product_variants
  has_many :product_categories, dependent: :delete_all
  has_many :categories, through: :product_categories
  has_many :seller_products, dependent: :delete_all
  has_many :sellers, through: :seller_products
  has_many_attached :mobile_photos
  accepts_nested_attributes_for :product_categories, allow_destroy: true
end
