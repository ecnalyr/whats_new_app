class HomeController < ApplicationController
  after_filter :update_last_visit

  def index
    last_visit_buffer = 30
    
    @all_stores = Product.all_stores
    @selected_stores = params[:stores] || session[:stores] || {}

    if @selected_stores == {}
      @selected_stores = Hash[@all_stores.map {|store| [store, store]}]
    end
    if params[:stores] != session[:stores]
      session[:stores] = @selected_stores
      redirect_to :stores => @selected_stores and return
    end
    # There is a limit of 150 items here for development reasons
    #   - Loading every single item in the database plus their pictures is stressful.
    #   - this needs to be moved to a variable somewhere.
    @products = Product.order("created_at desc").limit(150).find_all_by_store(@selected_stores.keys).group_by { |product| product.created_at.to_date}
    @last_visit = Time.parse(cookies[:last_visit]).utc - last_visit_buffer.minutes
    now = Time.now.utc

    respond_to do |format|
      format.html {}# index.html.erb
      format.json { render json: @products }
    end
  end
end
