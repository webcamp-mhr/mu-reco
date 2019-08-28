class GenresController < ApplicationController

	before_action :addmin_user_check, only: [:new, :create]

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

	def addmin_user_check
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end

