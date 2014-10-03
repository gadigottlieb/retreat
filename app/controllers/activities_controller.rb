class ActivitiesController < ApplicationController

  def index
  end

  def new
    @category = params[:category]
    @getaway_id = params[:getaway_id]
    if @category == 'stay'
      @question = 'Where did you stay?'
    elsif @category == 'eat'
      @question = 'Where did you eat?'
    else
      @question = 'What did you do?'
    end
  end

  def create
    @activity = Activity.create(activities_params)

    if !@activity.image_url
      @activity.image_url = 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg'
      @activity.save
    end
  end

  def change_photo
    @activity = Activity.find(params[:activity_id])
  end

  def update_photo
    @activity = Activity.find(params[:activity_id]);
    photo = GetawayPhoto.find(params[:photo_id]);
    @activity.image_url = photo.photo.url
    @activity.save

    render json: @activity
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  private
  def activities_params
    params.require(:activity).permit(:name, :getaway_id, :category, :comment)
  end
end
