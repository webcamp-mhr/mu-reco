class PurchaseHistoriesController < ApplicationController
	def index
		@purchase_histories = PurchaseHistory.page(params[:page]).reverse_order
	end

	def show
		@purchase_history = PurchaseHistory.find(params[:id])
		@purchase_products = PurchaseProduct.all
	end

	def edit
	end

	def new
		@carts = Cart.all
		@purchase_history = PurchaseHistory.new
    # binding.pry
	end



	def create
		@purchase_history = PurchaseHistory.new(purchase_history_params)
		@purchase_history.user_id = current_user.id
		# @purchase_history.address_id = current_user.address.id
		@purchase_history.save
		@carts = Cart.all
    @purchase_product = PurchaseProduct.new
    @purchase_product.purchase_history_id = @purchase_history.id
    @carts.each do |cart|
      if cart.check == true   #チェックがついてる場合
        @purchase_product.single_album_name = cart.product.single_album_name
        @purchase_product.jacket_image_id = cart.product.jacket_image_id
        @purchase_product.prodcut_price = cart.product.price
        @purchase_product.artist_name = cart.user.user_firstname
        @purchase_product.label_name = cart.product.label.label_name
        @purchase_product.genre_name = cart.product.genre.genre_name
        @purchase_product.purchase_quantity = cart.purchase_quantity
        @purchase_product.subtotal = cart.product.price
        @purchase_product.save
      end
    end
    if @purchase_product.save
      redirect_to products_path
    else
      render new_purchase_history_path
    end
	end

	def update
	end

	private

    def purchase_history_params
      params.require(:purchase_history).permit(:delivery_status, :payment_status)
    end
end
