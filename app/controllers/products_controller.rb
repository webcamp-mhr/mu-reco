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
    # @product.build_artist
    # @product.build_label
    # @product.build_genre
    @artist = Artist.new
    @disc = Disc.new
    @genre = Genre.new
    @label = Label.new

    # @discs = Disc.all

  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @artist = Artist.new(artist_params)
    @disc = Disc.new(disc_params)
    @genre = Genre.new(genre_params)
    @label = Label.new(label_params)
    @product.save
    @artist.save
    @disc.save
    @genre.save
    @label.save
    redirect_to products_path
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:single_album_name, :jacket_image, :price, :stock_quantity, :sales_status, :product_deleting_management)
    # params.require(:product).permit(:single_album_name, :jacket_image, :price, :stock_quantity, :sales_status, :product_deleting_management, artist_attribute: [:artist_name], label_attribute: [:label_name], genre_attribute: [:genre_name])
  end

  def artist_params
    params.require(:artist).permit(:artist_name)
  end

  def disc_params
    params.require(:disc).permit(:disc_name)
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def label_params
    params.require(:label).permit(:label_name)
  end
end

