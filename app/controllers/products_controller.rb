class ProductsController < ApplicationController
  after_filter :update_last_visit

  helper_method :sort_column, :sort_direction


  # GET /products
  # GET /products.json
  def index
    @products = Product.order(sort_column + " " + sort_direction)
    @last_visit = cookies[:last_visit]
    now = Time.now.utc
    respond_to do |format|
      format.html { flash[:notice] = "Last visit: #{@last_visit} , This visit: #{now}"}# index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    # @product = Product.new(params[:product])
    @product = Product.find_or_initialize_by_sku(params[:product])
    if @product.new_record?
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render json: @product, status: :created, location: @product }
        else
          format.html { render action: "new" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      update
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product ||= Product.find_or_initialize_by_sku(params[:sku])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  
end
