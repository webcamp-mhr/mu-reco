class ArtistsController < ApplicationController

	before_action :caddmin_user_check, only: [:new, :create]
	
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

	def addmin_user_check
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end


end
