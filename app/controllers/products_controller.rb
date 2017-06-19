class ProductsController < ApplicationController
	before_action :user_authorized, only: [:index]
	def index
		@current_user = current_user
		@products = Product.all
		@purchase_array = Purchase.all.pluck(:product_id)
	end
	def create
		product = Product.create(product_params.merge(user:current_user))
		if product.valid?
			redirect_to "/dashboard/#{session[:user_id]}"
		else
			flash[:product_errors] = product.errors.full_messages
			redirect_to "/dashboard/#{session[:user_id]}"
		end
	end
	def destroy
		Product.find(params[:id]).destroy
		redirect_to "/dashboard/#{session[:user_id]}"
	end
	private 
	def product_params
		params.require(:product).permit(:name, :amount)
	end
end
