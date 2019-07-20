class LabelsController < ApplicationController
	
	def destroy
	end

	def create
		@label = label.new(label_params)
    	@label.save
	end

	def update
	end

	private
	def label_params
		params.require(:label).permit(:label_name)
	end
end
