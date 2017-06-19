class UsersController < ApplicationController
	before_action :logged_in, only: [:new]
	def new
	end
	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			redirect_to '/shoes'
		else
			flash[:reg_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end
	def show
		@user = current_user
		@purchases = @user.products_bought
		@total_purchase = get_purchase_total
		@user_products = @user.products
		@purchase_array=Purchase.all.pluck(:product_id)
		@total_sales = get_sales_total
	end
	def get_sales_total
		sum = 0
		purchase_array = Purchase.all.pluck(:product_id)
		products = current_user.products
		products.each do |product|
			if purchase_array.include? product.id
				sum += product.amount
			end
		end
		return sum
	end
	def get_purchase_total
		sum = 0
		purchase_array = Purchase.all.pluck(:product_id)
		products = current_user.products_bought
		products.each do |product|
			sum += product.amount
		end
		return sum
	end
	private
	def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
