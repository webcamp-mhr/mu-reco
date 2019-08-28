class AddressesController < ApplicationController

	before_action :current_user_check, only: [:destroy]

	def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to edit_user_path(address.user)
	end

	def create
	end

	def update
	end

	private

	def current_user_check
    user = address.user
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end
