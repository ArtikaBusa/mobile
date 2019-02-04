class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:description).page(params[:page]).per(2)
    if params[:search].present?
      @products = Product.joins(:colors, :displays).where('colors.name LIKE ? OR displays.name LIKE  ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end
    @brand_ids = []
    if params[:brand_id].present?
      @brand_ids = params[:brand_id].split(',')
      @products = @products.where(brand_id: @brand_ids).order(:description).page(params[:page]).per(2)
    end
    @category_ids = []
    if params[:category_id].present?
      @category_ids = params[:category_id].split(',')
      @products = Product.left_outer_joins(:product_categories).where(product_categories: { category_id: @category_ids }).order(:description).page(params[:page]).per(2)
    end
    @processore_ids = []
    if params[:processore_id].present?
      @processore_ids = params[:processore_id].split(',')
      @products = Product.left_outer_joins(:product_variants).where(product_variants: { processore_id: @processore_ids }).order(:description).page(params[:page]).per(2)
    end
    @color_ids = []
    if params[:color_id].present?
      @color_ids = params[:color_id].split(',')
      @products = Product.left_outer_joins(:product_variants).where(product_variants: { color_id: @color_ids }).order(:description).page(params[:page]).per(2)
    end
    @display_ids = []
    if params[:display_id].present?
      @display_ids = params[:display_id].split(',')
      @products = Product.left_outer_joins(:product_variants).where(product_variants: { display_id: @display_ids }).order(:description).page(params[:page]).per(2)
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
    params.require(:product).permit(:description, :available, :release_year, :brand_id, mobile_photos: [])
  end
end
