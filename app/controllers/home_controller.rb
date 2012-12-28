class HomeController < ApplicationController
  def index
    # @products = Product.order("scrape_time desc")
    @products = Product.order("created_at desc").group_by { |product| product.created_at.to_date}

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end
end
