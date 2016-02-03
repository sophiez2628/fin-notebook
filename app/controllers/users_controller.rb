class UsersController < ApplicationController
  def new
    render :new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     sign_in(@user)
     redirect_to root_url
   else
     render :new
   end
  end

  def show
    render json: User.find(params[:id].to_i)
  end

  private
  def user_params
    params.require(:user).permit(:password, :email)
  end
end
