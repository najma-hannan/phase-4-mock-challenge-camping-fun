class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :activity_not_found
  def index
    render json: Activity.all, status: :ok
  end

  def destroy
    activity = find_activity
    activity.destroy
    head :no_content
  end

  private

  def find_activity
    Activity.find(params[:id])
  end

  def activity_not_found
    render json: { error: "Activity not found" }, status: :not_found
  end

end
