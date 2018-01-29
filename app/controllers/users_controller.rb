class UsersController < ApplicationController
	def index
		@users = User.all
		# @q = User.ransack(params[:q])
		# @users = @q.result(distinct: true)
	end

	def show
		@user = user.find(params[:id])
		@orders = @user.orders
	end

	def edit
		@user = user.find(params[:id])
	end

	def update
		user = user.find(params[:id])
		user.update
		redirect_to users_path
	end

	def destroy
		user = user.find(params[:id])
		user.delete_flag = true
		redirect_to users_path
	end

	private
		def user_params
			params.require(:user).permit(:firstname, :lastname, :firstname_kana, :lastname_kana, :zip_code, :adress, :phone, :email, :password, :gender, :age, :delete_flag)
		end
end
