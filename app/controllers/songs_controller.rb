class SongsController < ApplicationController
	def create
		@song = Song.new(song_params)
		@song.save
		rennder :edit
	end

	def update
		@song = Song.find(params[:id])
		@song.update
		render :edit
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		render :edit
	end

	private
		def song_params
			params.require(:song).permit(:disk_id, :song_name, :artist_id, :track_number, :song_length)
		end
end
