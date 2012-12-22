class HomeController < ApplicationController
  def index
    @products = Product.order("scrape_time desc")

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end
end
