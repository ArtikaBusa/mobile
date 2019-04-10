class OrderJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, seller_id)
    OrderMailer.user_email(user_id).deliver
    OrderMailer.seller_email(seller_id).deliver
  end
end
