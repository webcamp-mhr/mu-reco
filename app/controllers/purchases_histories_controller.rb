class PurchasesHistoriesController < ApplicationController
	def index
		@purchases_histories = PurchasesHistory.all.page(params[:page]).reverse_order
	end

	def show
		@purchases_history = PurchasesHistory.find(params[:id])
	end

	def edit
	end

	def new
	end



	def create
	end

	def update
	end
end
