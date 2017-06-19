class PurchasesController < ApplicationController
	def create
		Purchase.create(user:current_user, product:Product.find(params[:id]))
		redirect_to "/dashboard/#{session[:user_id]}"
	end
end
