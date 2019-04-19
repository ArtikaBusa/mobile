# frozen_string_literal: true

# :nodoc:
class WishlistsController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @favorite = current_user.wishlists.new(product_id: params[:id])
    redirect_to product_path if @favorite.save
  end

  def show
    @favorites = current_user.wishlists.all
  end

  def destroy
    @favorite = Wishlist.find(params[:id])
    @favorite.destroy
    redirect_to show_favorite_path
  end
end
