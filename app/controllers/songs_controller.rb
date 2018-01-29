class SongsController < ApplicationController
	def create
		song = Song.new(song_params)
		song.save
		redirect_to edit_item_path(song.disk.item.id)
	end

	def update
		song = Song.find(params[:id])
		song.update(song_params)
		redirect_to edit_item_path(song.disk.item.id)

	end

	def destroy
		song = Song.find(params[:id])
		song.destroy
		redirect_to edit_item_path(song.disk.item.id)
	end

	private
		def song_params
			params.require(:song).permit(:disk_id, :song_name, :artist_id, :track_number, :song_length)
		end
end
