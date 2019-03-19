class OrderController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.where(id: params[:id])
    @seller_product_variants = SellerProductVariant.where(id: params[:seller_product_variant_id])

    puts '-------'
    puts @seller_product_variants.to_json
    puts '--------'
  end

  def payment
    @products = Product.where(id: params[:id])
    @seller_product_variants = SellerProductVariant.where(id: params[:seller_product_variant_id])
    @product_variant = ProductVariant.joins(:seller_product_variants).where(seller_product_variants: { id: params[:seller_product_variant_id] })
    @seller = SellerProductVariant.find_by(params[:seller_product_variant_id])

    @order = current_user.orders.new(seller_id: @seller.seller_product.seller_id, product_variant_id: @product_variant.ids, price: @seller.price, discount: @seller.discount, final_price: @seller.final_price, seller_product_variant_id: params[:seller_product_variant_id])
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
    @products = Product.where(id: params[:id])
    @seller_product_variants = SellerProductVariant.where(id: params[:seller_product_variant_id])
    @product_variant = ProductVariant.joins(:seller_product_variants).where(seller_product_variants: { id: params[:seller_product_variant_id] })
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :seller_id, :seller_product_variant_id, :product_variant_id, :price, :discount, :final_price, :address, :city, :state, :pincode, :ordered_date, :shipping_date, :cancle_date, :payment_type, :payment_transaction)
  end
end
