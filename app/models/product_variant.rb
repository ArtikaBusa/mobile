class ProductVariant < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :storage, optional: true
  belongs_to :color, optional: true
  belongs_to :display, optional: true
  belongs_to :processor, optional: true
  has_many :seller_product_variants
  has_many :orders

  def name
    "#{try(:color).try(:name)} - #{try(:storage).try(:name)} - #{try(:display).try(:name)} - #{try(:processor).try(:name)}"
  end
end
