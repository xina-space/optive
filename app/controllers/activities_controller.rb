class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

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

  private

  def activity_params
    params.require(:activity).permit(:title)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end
