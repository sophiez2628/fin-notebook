class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_url(current_user.id)
    else
      render :new
    end
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      sign_in(user)
      redirect_to user_url(user.id)
    else
      render :new
    end
  end

  def destroy
    sign_out
    render json: {}
  end
end
