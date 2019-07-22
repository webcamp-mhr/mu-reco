class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])

    @artist = Artist.find(params[:id])
    @genre = Genre.find(params[:id])
    @label = Label.find(params[:id])
  end

  def new
    @product = Product.new
    @discs = Disc.all
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_path
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:single_album_name, :jacket_image, :price, :stock_quantity, :sales_status, :product_deleting_management)
  end

end

