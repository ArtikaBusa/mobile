# frozen_string_literal: true

module Vender
  # :nodoc:
  class OrdersController < ApplicationController
    before_action :authenticate_seller!
    def index
      @order = current_seller.orders.all
    end

    def show
      @order = Order.find_by(id: params[:id])
    end
  end
end
