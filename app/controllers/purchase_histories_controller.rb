class PurchaseHistoriesController < ApplicationController

  before_action :check_check, only: [:new]
  before_action :current_user_check, only: [:show]



 
 


	def index
		@purchase_histories = PurchaseHistory.page(params[:page]).reverse_order
	end

	def show
		@purchase_history = PurchaseHistory.find(params[:id])
		@purchase_products = PurchaseProduct.all
	end

	def edit
	end

  def update
    purchase_history = PurchaseHistory.find(params[:id])
    if purchase_history.update(purchase_history_params)
      redirect_to purchase_history_path(purchase_history)
    end
  end

	def new
		@carts = Cart.all
		@purchase_history = PurchaseHistory.new
    @purchase_history.total_price = 0  #初期値
    @carts.each do |cart|
      if cart.check == true   #チェックがついてる場合
        @purchase_history.total_price += cart.product.price * cart.purchase_quantity  #総計
      end
    end
    @purchase_history.total_price += 500  #送料分込み
	end

	def create
		@purchase_history = PurchaseHistory.new(purchase_history_params)
		@purchase_history.user_id = current_user.id
    #購入時の選択した住所idを元に郵便番号と住所を購入履歴テーブルのカラムに代入している
    @purchase_history.purchase_postcode = current_user.addresses.find(@purchase_history.purchase_address_id).postcode
    @purchase_history.purchase_address = current_user.addresses.find(@purchase_history.purchase_address_id).address
    @purchase_history.total_price = 0  #初期値
    @purchase_history.save #一度保存(purchase_history_idに代入する為)
		carts = Cart.all
    carts.each do |cart|
      if cart.check == true && (cart.purchase_quantity <= cart.product.stock_quantity) #チェックがついてる場合 && 購入枚数より在庫の方が多い場合
        @purchase_product = PurchaseProduct.new
        @purchase_product.purchase_history_id = @purchase_history.id
        @purchase_product.single_album_name = cart.product.single_album_name
        @purchase_product.jacket_image_id = cart.product.jacket_image_id
        @purchase_product.prodcut_price = cart.product.price
        @purchase_product.artist_name = cart.product.artist.artist_name
        @purchase_product.label_name = cart.product.label.label_name
        @purchase_product.genre_name = cart.product.genre.genre_name
        @purchase_product.purchase_quantity = cart.purchase_quantity
        @purchase_product.subtotal = cart.product.price
        @purchase_history.total_price += cart.product.price * cart.purchase_quantity  #総計
        cart.product.stock_quantity -= cart.purchase_quantity #購入分を在庫から減らす
        if @purchase_product.save && cart.product.save
          #チェックした商品をカートから削除する
          cart.destroy
        end
      end
    end
    @purchase_history.total_price += 500  #送料分込み

    if @purchase_history.save
      redirect_to products_path
    else
      render new_purchase_history_path
    end
	end

	private

    def purchase_history_params
      params.require(:purchase_history).permit(:delivery_status, :payment_status, :purchase_address_id)
    end

    def check_check
      carts = Cart.where(check: 1)
        if carts.count == 0
          redirect_to carts_path, notice: '何もえらんでないじゃん！ぷぷぷ'
        end
    end

    def current_user_check
    history = PurchaseHistory.find(params[:id])
    user = history.user
    if user_signed_in? && current_user != user
      redirect_to user_path(current_user)
    end
  end

end
