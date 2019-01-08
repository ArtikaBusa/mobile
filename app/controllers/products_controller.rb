class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if params[:search].present?
      @products = @products.where(brands: { name: params[:search] })
    end
    if params[:brand_id].present?
      @products = @products.where(brand_id: params[:brand_id])
    end
    if params[:category_id].present?
      @products = Product.includes(:product_categories).where(product_categories: { category_id: params[:category_id] })
    end
    if params[:processore_id].present?
      @products = Product.includes(:product_variants).where(product_variants: { processore_id: params[:processore_id] })
    end
    if params[:color_id].present?
      @products = Product.includes(:product_variants).where(product_variants: { color_id: params[:color_id] })
    end
    if params[:display_id].present?
      @products = Product.includes(:product_variants).where(product_variants: { display_id: params[:display_id] })
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:description, :available, :release_year, :brand_id)
  end
end
