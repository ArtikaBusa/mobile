module Users
  class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
      @order = current_user.orders.all
    end

    def show
      @orders = Order.find_by(id: params[:id])
    end

    def destroy
      @order = Order.find_by(id: params[:id])
      @order.destroy
      redirect_to users_orders_path
    end

    private

    def order_params
      params.require(:order).permit(:user_id, :seller_id, :seller_product_variant_id, :product_variant_id, :price, :discount, :final_price, :address, :city, :state, :pincode, :ordered_date, :shipping_date, :cancle_date, :payment_type, :payment_transaction)
    end
  end
end
