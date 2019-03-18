class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :cart
  has_many :product_variants
  has_many :colors, through: :product_variants
  has_many :displays, through: :product_variants
  has_many :processors, through: :product_variants
  has_many :storages, through: :product_variants

  has_many :product_categories, dependent: :delete_all
  has_many :categories, through: :product_categories

  has_many :seller_products
  has_many :sellers, through: :seller_products
  has_many :wishlists
  has_many_attached :mobile_photos
end
