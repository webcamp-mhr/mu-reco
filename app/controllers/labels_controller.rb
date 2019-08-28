class LabelsController < ApplicationController

	before_action :addmin_user_check, only: [:new, :create]
	
	def destroy
	end

	def new
		@label = Label.new
	end

	def create
		label = Label.new(label_params)
    label.save
    redirect_to new_product_path
	end

	def update
	end

	private
	def label_params
		params.require(:label).permit(:label_name)
	end

	def addmin_user_check
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
