class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user, only: [:show]
  before_action :require_admin, only: [:index, :edit, :destroy]

  def index
    @users = User.where(admin: false)
  end

  def show
    @user = User.find_by(id: params[:id])
    @phases = phases(@user) if @user
    # @phases.sort!
    if @user.nil?
       if current_user.admin?
        flash[:error] = "User doesn't exist!" 
        redirect_to users_path 
      else
        flash[:error] = "You don't have access!" 
        redirect_to user_path(session[:user_id])
      end

    elsif current_user.admin?
      @admin = current_user
      if @user.workouts && @user
       @workouts = @user.workouts
       render 'users/show', :locals => {:phases => @phases, workouts: @workouts }
      end
    else
      # Prevents clients to see other client's data###################
      unless session[:user_id] == @user.id
        flash[:error] = "You don't have access!"
        redirect_to user_path(session[:user_id])
      return
      end
      #################################################
      @workouts = current_user.workouts
      render 'users/show', :locals => {phases: @phases, workouts: @workouts }
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
      @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(email: params[:user][:email])

    if @user.update_attributes(user_params)
      flash[:success] = "User successfully updated!"
      redirect_to users_path
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    client = User.find_by(id: params[:id])
    if current_user.admin?
      if client.destroy
        flash[:success] = "User successfully deleted!"
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

  def phases(user)
    phase_collection = []
    user.workouts.each do |workout|
      phase_collection.push(workout.phase)
      phase_collection = phase_collection.uniq
    end
    return phase_collection
  end

end
