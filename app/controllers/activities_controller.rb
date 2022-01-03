class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show edit destroy update create new]

  def index
    if user_signed_in?
      # @activities = current_user.activities
      @activities = policy_scope(Activity)
    else
      # @activities = Activity.all
      @activities = policy_scope(Activity)
    end
    # authorize @activities
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if user_signed_in?
      @activity.user = current_user
      if @activity.save
        redirect_to activities_path
      else
        render :new
      end
    else
      @activity = Activity.new(activity_params)
      if @activity.save
        redirect_to activities_path
      else
        render :new
      end
    end
  end

  def show
    authorize @activity
  end

  def edit
    authorize @activity
  end

  def destroy
    authorize @activity
    @activity.destroy
    redirect_to activities_path
  end

  def update
    @activity.update(activity_params)
    authorize @activity
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
    authorize @activity
  end
end
