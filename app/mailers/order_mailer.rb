class OrderMailer < ApplicationMailer
  default from: 'busaartika@gmail.com'

  def user_email(user_id)
    @user = User.find(user_id)
    @order = Order.where(user_id: user_id).last
    attachments['Logo.png'] = File.read('app/assets/images/Logo.png')
    mail(to: @user.email, subject: 'Order Confirmation - Your Order with MobileStore has been successfully placed!')
  end

  def seller_email(seller_id)
    @seller = Seller.find(seller_id)
    @order = Order.where(seller_id: seller_id).last
    mail(to: @seller.email, subject: 'You Have Order From MobileStore User')
  end
end
