class UsersController < ApplicationController

	before_action :current_user_check, only: [:edit, :update, :destroy]

	def admin
	end

	def index
    @users = User.all.page(params[:page]).reverse_order

	end

	def show
		# 退会済みユーザーも取得
		@user = User.with_deleted.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
 	end

 	def destroy
 		user = User.find(params[:id])
 		user.destroy
 		redirect_to root_path
 	end

  private

 	def user_params
 		params.require(:user).permit(:user_lastname, :user_firstname, :user_lastname_kana, :user_firstname_kana, :phone_number, :email, addresses_attributes: [:id, :user_id, :address, :postcode, :address_priority, :_destroy])
 	end

 	def current_user_check
    user = User.find(params[:id])
    if user_signed_in? && current_user != user
      redirect_to user_path(current_user)
    end
  end

end
