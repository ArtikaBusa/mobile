class WishlistsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @favorite = current_user.wishlists.new(product_id: params[:id])

    if @favorite.save
      redirect_to favorite_item_path
    else
      puts '----------------'
      @favorite.errors.full_messages
      puts '--------------'
      redirect_to product_path
    end
  end
  def item
    @favorite = Wishlist.find_by(product_id: params[:id])
    puts "---------------"
    puts @favorite.to_json
  end

  def show
    @favorites = current_user.wishlists.all

  end

end
