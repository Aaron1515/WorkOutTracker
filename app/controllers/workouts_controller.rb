class WorkoutsController < ApplicationController

  def index
    @current_user = current_user
    @workout = Workout.find_by(id: params[:id])
    p @workout
  end

  def show
    @current_user = current_user
    @workout = Workout.find_by(id: params[:id])
    @workout
  end

  def new
    @current_user = current_user
    @workout = Workout.new
    @user = User.find_by(id: params[:user_id])
    @workout.user_id = @user.id
  end

  def create
    # binding.pry
    # current_user
    @workout = Workout.new(workout_params)
    @workout.user_id = params[:user_id]
    if @workout.save
      flash[:success] = "Workout successfully created"
      redirect_to user_path(params[:user_id])
    else
      render 'new'
    end
  end

  def update
    @current_user = current_user
    if request.xhr?
      @workout = Workout.find_by(id: params[:id])
      @workout.update(completed: true)
      render :json=>true
    end
  end

  def destroy
    @current_user = current_user
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def workout_params
    params.require(:workout).permit(:name, :sets, :reps, :weight, :rest, :phase, :day)
  end
end
