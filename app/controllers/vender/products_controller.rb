# frozen_string_literal: true

module Vender
  # :nodoc:
  class ProductsController < ApplicationController
    before_action :authenticate_seller!
    before_action :set_seller_product, only: %i[show edit update destroy]

    def index
      @vender_products = current_seller.seller_products.page(params[:page]).per(20)
    end

    def show; end

    def new
      @product_variant = Product.find_by(id: params[:product_id])
      @vender_product = current_seller.seller_products.new(product_id: params[:product_id])
    end

    def edit
      @product_variant = @vender_product.product
    end

    def create
      @vender_product = current_seller.seller_products.new(seller_product_params)
      respond_to do |format|
        if @vender_product.save
          format.html { redirect_to vender_products_url, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: vender_products_url }
        else
          format.html { render :new }
          format.json { render json: @vender_product.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @vender_product.update(seller_product_params)
          format.html { redirect_to vender_products_url, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: vender_products_url }
        else
          format.html { render :edit }
          format.json { render json: @vender_product.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @vender_product.destroy
      respond_to do |format|
        format.html { redirect_to vender_products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_seller_product
      @vender_product = SellerProduct.find_by(id: params[:id])
    end

    def seller_product_params
      params.require(:seller_product).permit(:product_id, :seller_id,
                                             seller_product_variants_attributes:
                                             %i[id product_variant_id price
                                                discount final_price _destroy])
    end
  end
end
