class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
		# @q = Artist.ransack(params[:q])
		# @artists = @q.result(distinct: true)
		@artist = Artist.new
	end

	def create
		artist = Artist.new(artist_params)
		artist.save
		redirect_to artists_path
	end

	def destroy
		artist = Artist.find(params[:id])
		artist.destroy
		redirect_to artists_path
	end

	private
		def artist_params
			params.require(:artist).permit(:artist_name)
		end

end
