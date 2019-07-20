class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).reverse_order
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
    @song_title = SongTitle.new

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
    @song_title = SongTitle.new(song_title_params)

    @genre.save
    @label.save
    @artist.save

    # @product.artist_id = @artist.id
    # @product.genre_id = @genre.id
    # @product.label_id = @label.id

    @product.save

    # @disc.product_id = @product.id
    # @song_title.disc_id = @disc.id

    @disc.save
    @song_title.save
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

  def song_title_params
    params.require(:song_title).permit(:song_title, :truck_number)
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def label_params
    params.require(:label).permit(:label_name)
  end
end

