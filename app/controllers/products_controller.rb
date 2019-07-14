class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    # has_many の場合は build_XXXで記載する
    #belongs_toの場合は XXX.build
    @product.build_artist
    @product.build_label
    @product.build_genre

    @disc = Disc.new
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
    params.require(:product).permit(artist_attribute: [:artist_name], :single_album_name, :jacket_image, 
      :price, label_attribute: [:label_name], genre_attribute: [:genre_name], :stock_quantity, :sales_status, :product_deleting_management)
  end
end
