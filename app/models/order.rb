class Order < ApplicationRecord
  after_save :email_processing
  validates :address, :city, :state, :pincode, presence: true
  belongs_to :seller
  belongs_to :user
  belongs_to :seller_product_variant
  belongs_to :product_variant

  def email_processing
    OrderJob.perform_later(user_id, seller_id)
  end
end
