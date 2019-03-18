module Vender
  # :nodoc:
  class OrderController < ApplicationController
    before_action :authenticate_seller!
    def index
      @order = current_seller.orders.all
    end
  end
end
