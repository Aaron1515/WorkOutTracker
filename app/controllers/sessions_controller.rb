class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    # binding.pry
    if @user = User.find_by(email: user_params[:email])
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to(@user)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    # binding.pry
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
