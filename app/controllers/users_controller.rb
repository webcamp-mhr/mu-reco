class UsersController < ApplicationController

	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
 	end

 	def destroy

 	end

 	def user_params
 		params.require(:user).permit(:user_lastname, :user_firstname, :user_lastname_kana, :user_firstname_kana, :phone_number, :email)
 	end
end
