class ArtistsController < ApplicationController
	def index
		@artists = Artist.all.page(params[:page]).reverse_order
		# @q = Artist.ransack(params[:q])
		# @artists = @q.result(distinct: true)
		@artist = Artist.new
	end

	def create
		artist = Artist.new(artist_params)
		artist.save
		redirect_to artists_path
	end

	def update
		artist = Artist.find(artist_params)
		artist.save
		redirect_to artists_path
	end

	def destroy
		artist = Artist.find(params[:id])
		if artist.items.any?
			flash[:alert] = "選択されたアーティストは、商品に登録されているため削除できません。"
		else
			artist.destroy
		end
		redirect_to artists_path
	end

	private
		def artist_params
			params.require(:artist).permit(:artist_name)
		end

end
