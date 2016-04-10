class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
  end

  def create
    if @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id + @user.name
        redirect_to @user
      else
        redirect "/users/new"
      end
    else
      redirect "/users/new"
    end
  end

  def update
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
