class OrderController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find_by(id: params[:id])
    @seller_product_variant = SellerProductVariant.where(id: params[:seller_product_variant_id])
    @time = Time.at(@product.release_year).strftime('%B %e, %Y at %I:%M %p')
    puts '-------'
    puts @product.to_json
    puts '--------'
  end

  def payment
    @product = Product.find_by(id: params[:id])
    @time = Time.at(@product.release_year).strftime('%B %e, %Y at %I:%M %p')
    @seller_product_variant = SellerProductVariant.where(id: params[:seller_product_variant_id])
    @product_variant = ProductVariant.joins(:seller_product_variants).where(seller_product_variants: { id: params[:seller_product_variant_id] })
    @seller = SellerProductVariant.find_by(id: params[:seller_product_variant_id])
    @orders = current_user.orders.all
    puts '--------------'
    puts @orders.to_json
    puts '---------------'
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
    @seller_product_variant = SellerProductVariant.where(id: params[:seller_product_variant_id])
    @order = current_user.orders.where(seller_product_variant_id: params[:seller_product_variant_id]).last
    puts '-----------'
    puts @order.to_json
    puts '------'
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :seller_id, :seller_product_variant_id, :product_variant_id, :price, :discount, :final_price, :address, :city, :state, :pincode, :ordered_date, :shipping_date, :cancle_date, :payment_type, :payment_transaction)
  end
end
