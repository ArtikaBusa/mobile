class ProductsController < ApplicationController
  before_action :set_product, only: :show

  def index
    @products = Product.all.order(:description).page(params[:page]).per(2)
    if (params[:price_min] && params[:price_max]).present?
      @price_min = params[:price_min].to_i
      @price_max = params[:price_max].to_i
      @products = Product.joins(:product_variants).where('price >= ? AND price <= ?', @price_min, @price_max).order(:description).page(params[:page]).per(2)
    end
    if params[:search].present?
      @products = Product.joins(:brand, :categories, :colors, :storages, :processors).where('brands.name LIKE ? OR categories.name LIKE  ? OR colors.name LIKE ? OR storages.name LIKE ? OR processors.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(2)
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
    @processor_ids = []
    if params[:processor_id].present?
      @processor_ids = params[:processor_id].split(',')
      @products = Product.left_outer_joins(:product_variants).where(product_variants: { processor_id: @processor_ids }).order(:description).page(params[:page]).per(2)
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
    @storage_ids = []
    if params[:storage_id].present?
      @storage_ids = params[:storage_id].split(',')
      @products = Product.left_outer_joins(:product_variants).where(product_variants: { storage_id: @storage_ids }).order(:description).page(params[:page]).per(2)
    end
  end

  def show
    @wishlist = Wishlist.find_by(product_id: params[:id])
    puts "---------"
    puts @wishlist.to_json
    puts "-----------"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :description, :available, :release_year, :brand_id, mobile_photos: []
    )
  end
end
