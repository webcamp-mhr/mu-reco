class CartsController < ApplicationController

	def destroy
		cart = Cart.find(params[:id])
		cart.destroy
		redirect_to carts_path
	end

	def create
		cart = current_user.carts.new(cart_params)
		cart.purchase_quantity = 1
		if cart.save
			redirect_to carts_path
		end
	end


	def index
		# @carts = Cart.where(user_id: current_user.id)
	end

	def update
		cart = Cart.find(params[:id])
		if cart.update(cart_params)
			redirect_to carts_path
		end
	end

	# PATCH(PUT) /carts/all
	def update_all
	  params.permit!
	  params[:carts].keys.each do |quantity|
	    @cart = Cart.find(quantity.to_i)
	    @cart.update(params[:carts][quantity])
	    	# render action: :index
	  end
	  redirect_to new_purchase_history_path
	end

	private
	def cart_params
		params.require(:cart).permit(:product_id, :user_id, :purchase_quantity)
	end

	def carts_params
		params.permit(:purchase_quantity)[:carts]
	end

end

