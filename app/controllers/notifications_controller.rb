class NotificationsController < ApplicationController
  def index
    @notifications=current_user.notifications
    unless @notifications.any?
      redirect_to root_path
    end
  end

  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_path
  end

end
