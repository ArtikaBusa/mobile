# frozen_string_literal: true

# :nodoc:
class OrderController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[index payment confirmation]

  def index; end

  def payment
    @seller = SellerProductVariant.find_by(id: params[:seller_product_variant_id])
    @order = current_user.orders.new(seller_id: @seller.seller_product.seller_id, product_variant_id: @seller.product_variant_id, price: @seller.price, discount: @seller.discount, final_price: @seller.final_price, seller_product_variant_id: params[:seller_product_variant_id])
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.ordered_date = Time.now
    if @order.save
      redirect_to order_payment_confirm_path
    else
      render action: 'payment'
    end
  end

  def confirmation
    @order = current_user.orders.where(seller_product_variant_id: params[:seller_product_variant_id]).last
  end

  private

  def set_order
    @product = Product.find_by(id: params[:id])
    @seller_product_variant = SellerProductVariant.where(id: params[:seller_product_variant_id])
  end

  def order_params
    params.require(:order).permit(:user_id, :seller_id,
                                  :seller_product_variant_id,
                                  :product_variant_id, :price, :discount,
                                  :final_price, :address, :city, :state,
                                  :pincode, :ordered_date, :shipping_date,
                                  :cancle_date, :payment_type,
                                  :payment_transaction)
  end
end
