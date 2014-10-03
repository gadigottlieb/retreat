class GetawaysController < ApplicationController

  def new
    @getaway = Getaway.new
  end

  def create
    @getaway = Getaway.create!(getaways_params)
    redirect_to getaway_path(@getaway)
  end

  def show
    @getaway = Getaway.find(params[:id])
    @random_photo_url = 'none'

    if @getaway.getaway_photos.count > 0
      @random_photo_url = @getaway.getaway_photos.sample.photo.url
    end

    @stay_activities = @getaway.activities.where(category: 'stay')
    @eat_activities = @getaway.activities.where(category: 'eat')
    @play_activities = @getaway.activities.where(category: 'play')
  end

  def edit
    @getaway = Getaway.find(params[:id])
  end

  def update
    @getaway = Getaway.find(params[:id])
    @getaway.update(getaways_params)
    if @getaway.save
      redirect_to getaway_path(@getaway)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @getaway = Getaway.find(params[:id])
    @getaway.destroy
    redirect_to user_path(@user)
  end

  def choose_date
    @getaway = Getaway.find(params[:getaway_id])
  end

  def add_comment
    @getaway = Getaway.find(params[:getaway_id])
  end

  def update_comment
    @getaway = Getaway.find(params[:getaway_id])
    @getaway.comment = params[:new_comment]
    @getaway.save
  end

  def copy
    # copying over a getaway from one user to another
    @getaway = Getaway.find(params[:getaway_id])
    new_getaway = @getaway.dup
    new_getaway.departure_date = params[:new_date]
    new_getaway.comment = nil
    new_getaway.save

    @getaway.activities.each do |activity|
      new_activity = activity.dup
      new_activity.comment = nil
      new_activity.image_url = 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg'
      new_activity.save

      new_getaway.activities << new_activity
    end

    current_user.getaways << new_getaway

    redirect_to getaway_path(new_getaway)
  end

  def getaways_params
    params.require(:getaway).permit(:city, :country, :comment, :departure_date, :user_id)
  end
end
