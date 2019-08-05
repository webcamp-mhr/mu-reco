class PurchasesHistoriesController < ApplicationController
	def index
		@purchases_histories = PurchasesHistory.page(params[:page]).reverse_order
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
	end

	def update
	end
end
