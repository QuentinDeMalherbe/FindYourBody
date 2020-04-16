class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @user = User.new
    @activities = Activity.all
      if params[:search].present? && params[:search][:sport_ou_lieu_ou_category].present?
        @activities = @activities.search_by_name_and_lieu_and_category(params[:search][:sport_ou_lieu_ou_category])
      end
      if params[:search].present? && params[:search][:level].present?
        level = Activity.level_in_integer(params[:search][:level])
        @activities = @activities.search_by_level(level)
      end
      if params[:search].present? && params[:search][:date].present?
        @activities = @activities.select { |activity| activity.date >= params[:search][:date].to_date}
      end
  end

  def show
    @user = User.new
    @activity = Activity.geocoded.find(params[:id])
    @book = Book.new
    @marker =
    {
      lat: @activity.latitude,
      lng: @activity.longitude
    }
  end

  def new
    @user = User.new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @user = User.new

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @user = User.new
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity =Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :date, :level, :address, :comment, :category_id, :price)
  end
end
