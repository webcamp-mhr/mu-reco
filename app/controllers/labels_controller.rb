class LabelsController < ApplicationController
	
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
end
