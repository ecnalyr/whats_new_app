class HomeController < ApplicationController
  after_filter :update_last_visit

  def index
    last_visit_buffer = 30000

    @products = Product.order("created_at desc").group_by { |product| product.store}

    if @products.count == 0
      @products = Product.new(:name => 'name', :store => 'store', :price => 1.15)
    end

    @last_visit = Time.parse(cookies[:last_visit]).utc - last_visit_buffer.minutes
    now = Time.now.utc

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end

end
