class NotificationsController < ApplicationController
  def index
    @notifications=current_user.notifications.order("created_at desc")
    unless @notifications.any?
      redirect_to root_path
    end
    @notifications.each do |n|
      n.update(checked: true)
    end
  end

  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_path
  end

  def redirekt
    Notification.find(params[:id]).update(checked: true)
    redirect_to Notification.find(params[:id]).url
  end

end
