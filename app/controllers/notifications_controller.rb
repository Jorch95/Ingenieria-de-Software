class NotificationsController < ApplicationController
  def index
    @notifications=current_user.notifications
  end

  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_path
  end

end
