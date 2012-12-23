class HomeController < ApplicationController
  def index
    # @products = Product.order("scrape_time desc")
    @products = Product.all.group_by { |product| product.updated_at.to_date}

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end
end
