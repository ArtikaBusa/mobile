# frozen_string_literal: true

# :nodoc:
class SellersController < ApplicationController
  def profile
    @seller = current_seller
  end
end
