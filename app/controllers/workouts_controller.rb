class WorkoutsController < ApplicationController

  def index
    # @current_user =
    current_user
    @workout = Workout.find_by(id: params[:id])
  end

  def show


    # @current_user =
    current_user
    @workout = Workout.find_by(id: params[:id])

    # @current_user = current_user
    # @workout = Workout.find_by(id: params[:id])
    # @workout
  end

  def new
    # @current_user = current_user
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
      flash[:error] = "Workout was not created"
      redirect_to user_path(params[:user_id])
    end
  end

  def edit
    # current_user
    if current_user.admin?
      @workout = Workout.find_by(id: params[:id])
      @user = User.find_by(id: params[:user_id])
    else
      redirect_to logout_path
    end
  end

  def update
    # if current_user.admin?
      if request.xhr?
        @workout = Workout.find_by(id: params[:id])
        @workout.update(completed: true)
        render :json=>true
      else
        @workout = Workout.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])
        if @workout.update(workout_params)
          flash[:success] = "Workout successfully updated!"
          redirect_to user_path(@user)
        else
          flash[:error] = "Your missing a field."
          redirect_to edit_user_workout_path(@user, @workout)
        end
      end
    # end
  end

  def destroy
    @workout = Workout.find_by(id: params[:id])
    if @workout.destroy
      flash[:success] = "Workout successfully deleted!"
      redirect_to user_path
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :sets, :reps, :weight, :completed, :rest, :phase, :day, :note, :user_id)
  end
end
