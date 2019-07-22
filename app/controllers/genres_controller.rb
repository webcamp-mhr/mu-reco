class GenresController < ApplicationController

	def destroy
	end

	def new
		@genre = Genre.new
	end

	def create
		genre = Genre.new(genre_params)
    genre.save
    redirect_to new_product_path
	end

	def update
	end


	private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end
end

