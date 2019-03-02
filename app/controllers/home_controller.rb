class HomeController < ApplicationController
  def index
    @products = Product.joins(:brand).where(release_year: Time.current.beginning_of_month..Time.current.end_of_month).order(:description).page(params[:page]).per(2)
  end
end
