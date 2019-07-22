class SongsTitlesController < ApplicationController

  def destroy
  end

  def new
    @song_title = SongTitle.new
  end

  def create
    song_title = SongTitle.new(song_title_params)
    song_title.save
  end

  def update
  end

  private
  def song_title_params
    params.require(:song_title).permit(:song_title)
  end
end
