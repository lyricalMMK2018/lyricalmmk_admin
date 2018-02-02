class UsersController < ApplicationController
	def index
		@users = User.order(:updated_at)
		# @q = User.ransack(params[:q])
		# @users = @q.result(distinct: true)
	end

	def show
		@user = User.find(params[:id])
		@orders = @user.orders.reverse_order
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

	private
		def user_params
			params.require(:user).permit(:firstname, :lastname, :firstname_kana, :lastname_kana, :zip_code, :address, :phone, :email, :password, :gender, :age, :delete_flag)
		end
end
