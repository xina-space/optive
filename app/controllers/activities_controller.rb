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

  private

  def activity_params
    params.require(:activity).permit(:title)
  end

end
