class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @label = Label.new
    @genre = Genre.new
    @artist = Artist.new
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
