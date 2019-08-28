class DiscsController < ApplicationController

  before_action :addmin_user_check, only: [:new, :create, :destroy,]


  def new
    @disc = Disc.new
    @disc.song_titles.build
  end

  def create
    disc = Disc.new(disc_params)
    disc.save
    redirect_to new_product_path
  end

  def destroy
    disc = Disc.find(params[:id])
    disc.destroy
    redirect_to new_product_path
  end

  private
    def disc_params
      params.require(:disc).permit(:disc_name, song_titles_attributes: [:id, :song_title, :_destroy])
    end

    def addmin_user_check
      if user_signed_in?
        redirect_to user_path(current_user)
      end
    end

end
