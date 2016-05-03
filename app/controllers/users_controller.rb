class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    current_user
    @user = User.find_by(id: session[:user_id])
    if session[:user_id]
      @admin = User.find_by(id: session[:user_id])
      if @admin.admin == true
        @users = User.where(admin: false)
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end

  def show
    current_user
    @user = User.find_by(id: params[:id])
    # user = User.find_by(id: session[:user_id])
    phases = phases(@user)
    phases.sort!
    if @current_user.admin == true
      @admin = @current_user
      if @user.workouts
       @workouts = @user.workouts
       render 'users/show', :locals => {:phases => phases }
      end
    else
      @user = @current_user
      workouts = @current_user.workouts
      render 'users/show', :locals => {phases: phases, workouts: workouts }
    end
  end

  def new
  end

  def create
    if @user = User.new(user_params)
      if @user.save
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
    current_user
    if @current_user.admin == true
      @user = User.find_by(id: params[:id])
    else
      redirect_to @current_user
    end
  end

  def update
    @admin = User.find_by(id: session[:user_id])
    if @admin.admin == true
      @user = User.find_by(email: params[:user][:email])
      if @user.update_attributes(user_params)
        redirect_to users_path
      else
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy
    current_user
    client = User.find_by(id: params[:id])
    if @current_user.admin == true
      if client.destroy
        redirect_to users_path
      else
        redirect_to users_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def phases(user)
  phase_collection = []
  user.workouts.each do |workout|
    phase_collection.push(workout.phase)
    phase_collection = phase_collection.uniq
  end
  return phase_collection
  end

end
