class GenresController < ApplicationController
	def index
		@genres = Genre.all
		# @q = Genre.ransack(params[:q])
		# @genres = @q.result(distinct: true)
		@genre = Genre.new
	end

	def create
		genre = Genre.new(genre_params)
		genre.save
		redirect_to genres_path
	end

	def destroy
		genre = Genre.find(params[:id])
		genre.destroy
		redirect_to genres_path
	end

	private
		def genre_params
			params.require(:genre).permit(:genre_name)
		end
end
