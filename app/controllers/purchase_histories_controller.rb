class PurchaseHistoriesController < ApplicationController
	def index
		@purchases_histories = PurchasesHistory.all.page(params[:page]).reverse_order
	end

	def show
		@purchases_history = PurchasesHistory.find(params[:id])
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
		@purchase_history.save
		@purchase_history.user_id = current_user.id
		# @purchase_history.address_id = current_user.address.id
		redirect_to purchase_products_path, method: :post



	end

	def update
	end

	private

    def purchase_history_params
      params.require(:purchase_history).permit(:total_price, :delivery_status)
    end
end
