class ArtistsController < ApplicationController
	
	def destroy
	end

	def create
		@artist = artist.new(artist_params)
    	@artist.save
	end

	def update
	end

	private
	def artist_params
		params.require(:artist).permit(:artist_name)
	end
end
