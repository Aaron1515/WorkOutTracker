class WorkoutsController < ApplicationController

  def index
  end

  def new
    @workout = Workout.new
    @user = User.find_by(id: params[:user_id])
    @workout.user_id = @user.id
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = params[:user_id]
    if @workout.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :sets, :reps, :weight)
  end
end
