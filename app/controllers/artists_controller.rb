class ArtistsController < ApplicationController
	
	def destroy
	end

	def new
		@artist = Artist.new
	end

	def create
		artist = Artist.new(artist_params)
    artist.save
    redirect_to new_product_path
	end

	def update
	end

	private
	def artist_params
		params.require(:artist).permit(:artist_name)
	end
end
