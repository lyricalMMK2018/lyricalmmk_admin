class GenresController < ApplicationController
	def index
		@genres = Genre.all.page(params[:page]).reverse_order
		# @q = Genre.ransack(params[:q])
		# @genres = @q.result(distinct: true)
		@genre = Genre.new
	end

	def create
		genre = Genre.new(genre_params)
		genre.save
		redirect_to genres_path
	end

	def update
		genre = Genre.find(params[:id])
		genre.update(genre_params)
		redirect_to genres_path
	end

	def destroy
		genre = Genre.find(params[:id])
		if genre.items.any?
			redirect_to genres_path, alert: "選択されたジャンルは、商品に登録されているため削除できません。"
		else
			genre.destroy
			redirect_to genres_path
		end
	end

	private
		def genre_params
			params.require(:genre).permit(:genre_name)
		end
end
