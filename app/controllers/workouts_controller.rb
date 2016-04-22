class WorkoutsController < ApplicationController

  def index
  end

  def new
    @workout = Workout.new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    p '%%%%%%%%%' * 100
    @workout = params[:workout][:workout]
    p @workout[:name]
    p '%%%%%%%%%' * 100
    @workout = Workout.new(name: @workout[:name],sets: @workout[:sets], reps: @workout[:reps], weight: @workout[:weight],user_id: @workout[:user_id])
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
    params.require(:workout).permit(:name, :sets, :reps, :weight, :user_id)
  end
end
