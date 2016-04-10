class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @workouts = Workout.where(user_id: params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
