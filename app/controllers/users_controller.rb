class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	# debugger
  end

  def create
  	@user = User.new(user_params)  # Not the final impl
  	if @user.save
   		# Success
   		flash[:success] = "Welcome to the Sample App!"
   		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

end
