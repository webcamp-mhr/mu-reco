class CartsController < ApplicationController

	def destroy
		cart = Cart.find(params[:id])
		cart.destroy
		redirect_to carts_path
	end

	def create
		cart = Cart.new(cart_params)
		cart.purchase_quantity = 1
		if cart.save
			redirect_to carts_path
		end
	end


	def index
		@carts = Cart.all
	end

	def update
		cart = Cart.find(params[:id])
		if cart.update(cart_params)
			redirect_to carts_path
		end
	end

	private
	def cart_params
		params.require(:cart).permit(:product_id, :user_id, :purchase_quantity)
	end

end
