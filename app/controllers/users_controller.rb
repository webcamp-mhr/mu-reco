class UsersController < ApplicationController

	def index
    @users = User.all.page(params[:page]).reverse_order

	end

	def show
		@user = User.find(params[:id])

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
 	end

 	def destroy

 	end

  private

 	def user_params
 		params.require(:user).permit(:user_lastname, :user_firstname, :user_lastname_kana, :user_firstname_kana, :phone_number, :email)
 	end

end
