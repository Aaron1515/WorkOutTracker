class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
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

  def edit
    # binding.pry
    admin = User.find_by(id: session[:user_id])
    if admin.admin == true
      @user = User.find_by(id: params[:id])
    else
      redirect_to new_user_path
    end
  end

  def update
    # binding.pry
    @user = User.find_by(id: session[:user_id])
    if @user.admin == true
      user = User.find_by(email: params[:user][:email])
      if user.update_attributes(user_params)
        redirect_to users_path(@user)
      else
        render "edit"
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
