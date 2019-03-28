class SellersController < ApplicationController
  def profile
    @seller = current_seller
  end
end
