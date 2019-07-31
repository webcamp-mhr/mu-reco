class AddressesController < ApplicationController

	def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to edit_user_path(address.user)
	end

	def create
	end

	def update
	end
  
end
