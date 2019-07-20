class GenresController < ApplicationController
	
	def destroy
	end

	def create
		@genre = genre.new(genre_params)
    	@genre.save
	end

	def update
	end


	private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end
end

