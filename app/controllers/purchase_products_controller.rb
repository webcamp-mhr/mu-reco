class PurchaseProductsController < ApplicationController

  def create
    @carts = Cart.all
    @purchase_product = PurchaseProduct.new
    @carts.each do |cart|
      # if cart.check   #チェックがついてる場合
        # binding.pry
        @purchase_product.single_album_name = cart.product.single_album_name
        # @purchase_product.jacket_image_id = cart.product.jacket_image_id
        @purchase_product.prodcut_price = cart.product.price
        @purchase_product.artist_name = cart.user.user_firstname
        @purchase_product.label_name = cart.product.label.label_name
        @purchase_product.genre_name = cart.product.label.label_name
        @purchase_product.purchase_quantity = cart.purchase_quantity
        @purchase_product.subtotal = cart.product.price
      # end
    end
    if @purchase_product.save
      redirect_to products_path
    else
      render new_purchase_history_path
    end
  end

end
