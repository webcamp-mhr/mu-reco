class ProductsController < ApplicationController

  before_action :addmin_user_check, only: [:new, :create, :edit, :update, :destroy]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])

    @cart = Cart.new
  end

  def new
    @product = Product.new
    @disc = @product.discs.build
    @song_title = @disc.song_titles.build
  end

  def create
    @product = Product.new(product_params)
    # 税込価格で表示させるため8%の税をかける
     if @product.price != nil
      @product.price *= 1.08
    end
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else
      redirect_to product_path(@product)
    end
  end

  private

    def product_params
      params.require(:product).permit(:single_album_name, :jacket_image, :price, :stock_quantity, :sales_status, :artist_id, :label_id, :genre_id, :jacket_image, discs_attributes: [:id, :disc_name, :_destroy, song_titles_attributes: [:id, :song_title, :truck_number, :_destroy]])
    end

    def addmin_user_check
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

end



