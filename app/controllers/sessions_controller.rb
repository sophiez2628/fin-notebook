class SessionsController < ApplicationController
  def new
    if current_user
      render json: current_user
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
      render json: user
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    sign_out
    render json: {}
  end
end
