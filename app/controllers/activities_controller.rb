class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  # before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[create index new save show]
  after_action :verify_authorized, except: [:index, :show]
  # skip_before_action :authenticate_user!, only: %i[index show edit destroy update create new]

  def index
    # @user = User.last
    # authorize @user
    # @user = User.last(params[:id])
    # authorize @user
    @activities = policy_scope(Activity)
    # @activities = Activity.all
    # @activity.user = current_or_guest_user
    authorize Activity
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    @activity.user = current_or_guest_user
    if @activity.save
      redirect_to activities_path
    else
      render :new
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

  # def set_user
  #   @user = User.find(params[:id])
  #   authorize @user
  # end
end
