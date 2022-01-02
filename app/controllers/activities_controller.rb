class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if user_signed_in?
      @activity.user = current_user
      if @activity.save
        redirect_to activities_path
      else
        render :new
      end
    else
      # @activity = Activity.new(activity_params)
      if @activity.save
        redirect_to activities_path
      else
        render :new
      end
    end
  end

  def show;  end

  def edit; end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  def update
    @activity.update(activity_params)
    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render :edit
    end
  end

  def sample
    @activity = Activity.all.sample
  end

  private

  def activity_params
    params.require(:activity).permit(:title, completed: false)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end
