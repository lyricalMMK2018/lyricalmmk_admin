class AdminsController < ApplicationController
	def show
	end

	private
		def admin_params
			params.require(:admin).permit(:email, :password)
		end
end
