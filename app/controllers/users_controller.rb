class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    # binding.pry
    if session[:user_id]
      @user=User.find_by(id: session[:user_id])
      if @user.admin == true
        @users = User.where(admin: false)
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @workouts = Workout.where(user_id: params[:id])
  end

  def new
  end

  def create
    if @user = User.new(user_params)
      # binding.pry
      if @user.save
        # binding.pry
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
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
