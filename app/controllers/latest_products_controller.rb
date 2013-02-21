class LatestProductsController < ApplicationController
  after_filter :update_last_visit

  def index
    last_visit_buffer = 30
    @number_of_products = 150
    
    @all_stores = Product.all_stores
    @selected_stores = params[:stores] || session[:stores] || {}

    if @selected_stores == {}
      @selected_stores = Hash[@all_stores.map {|store| [store, store]}]
    end
    if params[:stores] != session[:stores]
      session[:stores] = params[:stores]
      redirect_to :stores => @selected_stores and return
    end
    
    @products = Product.order("created_at desc").limit(@number_of_products).find_all_by_store(@selected_stores.keys).group_by { |product| product.created_at.to_date}
    @last_visit = Time.parse(cookies[:last_visit]).utc - last_visit_buffer.minutes
    now = Time.now.utc

    if !params[:view].nil?
      @partial = params[:view]
      session[:view] = params[:view]
    else
      @partial = session[:view] || "grid"
    end
    
    logger.info(params)
    logger.info("^^^ THERE WERE YOUR PARAMS AHHHH!!!!!")

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end
end
